class CursosController < ApplicationController
    def new
        @curso = Curso.new
        @Users = User.where(rol: 'Profesor')
        @Asignaturas = Asignatura.all
        @Aulas = Aula.all
    end
    def show
        @cursos = Curso.all
        @Users = User.where(rol: 'Profesor')
    end
    def create
        @curso = Curso.new(curso_params)
        if @curso.save
            flash[:success] = "Curso guardado exitosamente!"
            redirect_to '/cursos'
        else
            flash[:error] = "Hubo un error al almacenar el curso."
            redirect_to '/cursos'
        end
    end
    def edit
        @curso = Curso.find(params[:id])
        @Users = User.where(rol: 'Profesor')
        @Asignaturas = Asignatura.all
        @Aulas = Aula.all
    end
    def update
        @curso = Curso.find(params[:id])
        if @curso.update(curso_params)
            flash[:success] = "Curso editado exitosamente!"
            redirect_to '/cursos'
        else
            flash[:error] = "Hubo un error al editar el curso."
            redirect_to '/cursos'
        end
    end
    
    def update_curso_notas
        @notas = Inscripcion.where("cursoID = ?", params[:id])
    end
    def new_inscripcion
       @alumnos = User.where('rol = "Alumno" and activo = true and grado = "' + Aula.find(Curso.find(params[:id]).aulaID).grado + '"')
    end
    
    def crear_inscripcion
        @users = User.find(params[:users_ids])
        @users.each do |p|
            @aux = Inscripcion.where('activo = true and alumnoID = "' + p.id.to_s + '" and cursoID = "' + params[:id] + '"').first
            if @aux == nil 
                @inscripcion = Inscripcion.new
                @inscripcion.cursoID = params[:id]
                @inscripcion.alumnoID = p.id
                @inscripcion.periodo = 1
                @inscripcion.activo = true
                @inscripcion.save
                @inscripcion = Inscripcion.new
                @inscripcion.cursoID = params[:id]
                @inscripcion.alumnoID = p.id
                @inscripcion.periodo = 2
                @inscripcion.activo = true
                @inscripcion.save
                @inscripcion = Inscripcion.new
                @inscripcion.cursoID = params[:id]
                @inscripcion.alumnoID = p.id
                @inscripcion.periodo = 3
                @inscripcion.activo = true
                @inscripcion.save
                @inscripcion = Inscripcion.new
                @inscripcion.cursoID = params[:id]
                @inscripcion.alumnoID = p.id
                @inscripcion.periodo = 4
                @inscripcion.activo = true
                @inscripcion.save
            end
            flash[:success] = "Alumnos inscritos guardado exitosamente!"
        end
        
            redirect_to '/cursos'
    end
    private
        def curso_params
             params.require(:curso).permit(:cursoID, :asignaturaID, :profesorID, :aulaID, :horario, :activo)
        end
    
end
