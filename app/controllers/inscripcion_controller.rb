class InscripcionController < ApplicationController
    def show
        @inscripciones = Inscripcion.all
    end
    def update
        Inscripcion.update(params[:notas].keys, params[:notas].values)
        flash[:success] = "Notas subidas exitosamente!"
        if current_user.administrador?
            redirect_to '/cursos'
        else
            redirect_to '/subir_notas'
        end
    end
    def periodo_recuperacion
        @inscripciones = Inscripcion.where('activo = true')
        total = 0.0
        @inscripciones.each do |ins|
            total = total + (((ins.eval1 * 0.05) + (ins.eval2 * 0.1) + (ins.eval3 * 0.1) + 
                                (ins.eval4 * 0.1) + (ins.eval5 * 0.05) + (ins.eval6 * 0.1) + 
                                (ins.eval7 * 0.1) + (ins.eval8 * 0.1) + (ins.eval9 * 0.3)) * 0.25)
            #Ya teniendo todas las notas del periodo
            if ins.periodo === 4
                #verificamos si es de 3er ciclo o bach, dependiendo de eso, le ponemos 6 p 7
                if User.find(ins.alumnoID).grado == 7 || User.find(ins.alumnoID).grado == 8|| User.find(ins.alumnoID).grado == 9
                    if total < 6 #es de 3er ciclo
                        @es_repetido = Inscripcion.where(periodo: 5, cursoID: ins.cursoID, alumnoID: ins.alumnoID).first
                        if @es_repetido === nil
                            @recuperacion = Inscripcion.new
                            @recuperacion.cursoID = ins.cursoID
                            @recuperacion.alumnoID = ins.alumnoID
                            @recuperacion.eval1 = ins.eval1
                            @recuperacion.periodo = 5
                            @recuperacion.activo = true
                            @recuperacion.save
                        end
                    end
                else #es de bach
                    if total < 7
                        @es_repetido = Inscripcion.where(periodo: 5, cursoID: ins.cursoID, alumnoID: ins.alumnoID).first
                        if @es_repetido === nil
                            @recuperacion = Inscripcion.new
                            @recuperacion.cursoID = ins.cursoID
                            @recuperacion.alumnoID = ins.alumnoID
                            @recuperacion.periodo = 5
                            @recuperacion.activo = true
                            @recuperacion.save
                        end
                    end
                # una vez ya sabiendo si paso el periodo o no, se resetea a 4
                total = 0.0
                end
            end
        end
        flash[:success] = "Periodo de recuperacion creado exitosamente!"
        redirect_to '/configuracion'
        rescue 
            flash[:error] = "Error al crear periodo de recuperacion!"
            redirect_to '/configuracion'
    end
    helper_method :periodo_recuperacion
    
    def promover_alumnos
        paso_grado = 1
        total = 0.0 
        nota_final = 0.0
        @alumnos = User.where('activo = true')
        @alumnos.each do |alm|
            
            @inscripciones = Inscripcion.where('alumnoID = "' + alm.id.to_s + '" and periodo != 5')
            @inscripciones.each do |ins| 
                nota_final = 0.0
                total = total + (((ins.eval1 * 0.05) + (ins.eval2 * 0.1) + (ins.eval3 * 0.1) + 
                                (ins.eval4 * 0.1) + (ins.eval5 * 0.05) + (ins.eval6 * 0.1) + 
                                (ins.eval7 * 0.1) + (ins.eval8 * 0.1) + (ins.eval9 * 0.3)) * 0.25)
                if ins.periodo === 4
                    if User.find(ins.alumnoID).grado === "7" || User.find(ins.alumnoID).grado === "8" || User.find(ins.alumnoID).grado === "9"
                       #es de 3er ciclo
                       if total < 6 #es de 3er ciclo
                            @recuperacion = Inscripcion.where('periodo = 5 and alumnoID = "' +  alm.id.to_s + '" and cursoID = "' + ins.cursoID + '"').first
                            nota_final = 0.0
                            nota_final = (@recuperacion.eval1 * 0.05) + (@recuperacion.eval2 * 0.1) + (@recuperacion.eval3 * 0.1) + 
                                         (@recuperacion.eval4 * 0.1) + (@recuperacion.eval5 * 0.05) + (@recuperacion.eval6 * 0.1) + 
                                         (@recuperacion.eval7 * 0.1) + (@recuperacion.eval8 * 0.1) + (@recuperacion.eval9 * 0.3)
                            if nota_final < 6
                                paso_grado = 0 # al final no paso el grado
                            end
                       end
                   else
                       #es de bach 
                       if total < 7 #es de 3er ciclo
                            @recuperacion = Inscripcion.where('periodo = 5 and alumnoID = "' + ins.alumnoID + '" and cursoID = "' + ins.cursoID + '"').first
                            nota_final = 0.0
                            nota_final =(@recuperacion.eval1 * 0.05) + (@recuperacion.eval2 * 0.1) + (@recuperacion.eval3 * 0.1) + 
                                        (@recuperacion.eval4 * 0.1) + (@recuperacion.eval5 * 0.05) + (@recuperacion.eval6 * 0.1) + 
                                        (@recuperacion.eval7 * 0.1) + (@recuperacion.eval8 * 0.1) + (@recuperacion.eval9 * 0.3)
                            if nota_final < 7
                                paso_grado = 0
                            end
                       end
                    end
                    total = 0.0
                end
            end
            #ya terminamos de revisar todas las materias, para ver si las paso: 
            if paso_grado === 1
                @alumno = User.find(alm.id)
                alm.grado = (alm.grado.to_i + 1).to_s
                if alm.grado === "12"
                    alm.activo = false
                end
                @alumno.update_attributes(:grado => alm.grado, :activo => alm.activo)
            end
            paso_grado = 1
            total = 0.0 
        end
        flash[:success] = "Se promovieron todos los alumnos al siguiente año exitosamente!"
        redirect_to '/configuracion'
        rescue 
            flash[:error] = "Error al promover alumnos!"
            redirect_to '/configuracion'
    end
    helper_method :promover_alumnos
    
    def cerrar_anio
        @inscripciones = Inscripcion.where('activo = true')
        #@graduados = User.where('activo = true and grado = 12')
        @aulas = Aula.where('actual = true')
        @cursos = Curso.where('activo = true')
        
        @inscripciones.each do |ins|
            ins.update_attributes(:activo => false)
        end
        @aulas.each do |aula|
            aula.update_attributes(:actual => false)
        end
        @cursos.each do |cur|
            cur.update_attributes(:activo => false)
        end
        
        flash[:success] = "Año cerrado exitosamente!"
        redirect_to '/configuracion'
        
        #rescue 
         #   flash[:error] = "Error al cerrar el año escolar!"
         #   redirect_to '/configuracion'
    end 
    helper_method :cerrar_anio
end

