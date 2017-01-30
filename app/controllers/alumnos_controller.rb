class AlumnosController < ApplicationController
    def show
        @users = User.where(rol: 'Alumno')
        respond_to do |format|
            format.html
            format.json
            format.pdf {render template: 'alumnos/info_alumno', pdf: 'Test' }
        end
    end
    def edit
        begin
            @Users = User.where(rol: 'Profesor')
            @users = User.find(params[:users_ids])
        rescue
            flash[:error] = "Debe seleccionar al menos un usuario para editar!"
            redirect_to '/alumnos'
        end
    end
    def show_grades
        begin
            @alumno = User.find(session[:user_id])
            #@notas = Inscripcion.where(alumnoID: session[:user_id])
            @notas = Inscripcion.where('alumnoID = ' + session[:user_id].to_s + ' and periodo != 5 and activo = true') 
            @recuperacion = Inscripcion.where('alumnoID = ' + session[:user_id].to_s + ' and periodo = 5 and activo = true')
            respond_to do |format|
                format.html
                format.json
                format.pdf {
                    render template: 'alumnos/mis_notas', 
                    pdf: @alumno.name, 
                    orientation: 'Landscape',
                    page_size: 'Letter'
                }
            end 
        end
    end
    
    def calcular_acumulado(alumno_id, curso_id)
         @notas = Inscripcion.where('activo = true and cursoID = "' + curso_id + '" and alumnoID = "' + alumno_id + '" and periodo != 5' )
         total = 0.0
         @notas.each do |nota|
             total = total + (((nota.eval1 * 0.05) + (nota.eval2 * 0.1) + (nota.eval3 * 0.1) + 
                                (nota.eval4 * 0.1) + (nota.eval5 * 0.05) + (nota.eval6 * 0.1) + 
                                (nota.eval7 * 0.1) + (nota.eval8 * 0.1) + (nota.eval9 * 0.3)) * 0.25)
         end
         return total
    end
    helper_method :calcular_acumulado
    
    def update
        User.update(params[:users].keys, params[:users].values)
        flash[:success] = "Usuarios editados exitosamente!"
        redirect_to '/alumnos'
    end
    private
        def alumno_params
            params.require(:user).permit(:name, :email, :carnet, :profesorID, :grado, :activo)
        end
end
