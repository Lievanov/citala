class ProfesoresController < ApplicationController
    def show
        @users = User.where(rol: 'Profesor')
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @users = User.find(params[:id])
        if @users.update(profesor_params)
            flash[:success] = "Profesor editado exitosamente!"
            redirect_to '/profesores'
        else
            flash[:error] = "Hubo un error al editar el Profesor."
            redirect_to '/profesores'
        end
    end
    def update_grades
        @notas = Curso.where("profesorID = ? and activo = true", session[:user_id])
    end
    def update_selected_grade
        @notas = Inscripcion.where("cursoID = ? AND periodo = ?", params[:id], params[:periodo])
        respond_to do |format|
            format.html
            format.json
            format.pdf {
                render template: 'profesores/listado_alumnos', 
                pdf: "Listado_alumnos", 
                orientation: 'Landscape',
                page_size: 'Letter'
            }
        end
    end
    def update_selected_grade_notas
        @notas = Inscripcion.where("cursoID = ?", params[:id]).order(:alumnoID)
        respond_to do |format|
            format.html
            format.json
            format.pdf {
                render template: 'profesores/notas_alumnos', 
                pdf: "Listado_alumnos", 
                orientation: 'Landscape',
                page_size: 'Letter'
            }
        end
    end
    def alumnos
        @mis_alumnos = User.where(profesorID: session[:user_id])
    end
    def info_alumno
        @alumno = User.find(params[:id])
        respond_to do |format|
            format.html
            format.json
            format.pdf {
                render template: 'profesores/info_alumno', 
                pdf: @alumno.name, 
                #orientation: 'Landscape',
                page_size: 'Letter'
            }
        end
    end
    private
        def profesor_params
            params.require(:user).permit(:name, :email, :carnet, :activo)
        end
end
