class AsignaturasController < ApplicationController
    def new
        @asignaturas = Asignatura.all
        @asignatura = Asignatura.new
    end
    def create
        @asignatura = Asignatura.new(asignatura_params)
        if @asignatura.save
            flash[:success] = "Asignatura guardada exitosamente!"
            redirect_to '/asignaturas'
        else
            flash[:error] = "Hubo un error al almacenar la asignatura."
            redirect_to '/asignaturas'
        end
    end
    def edit
        @asignatura = Asignatura.find(params[:id])
    end
    def update
        @asignatura = Asignatura.find(params[:id])
        if @asignatura.update(asignatura_params)
            flash[:success] = "Asignatura editada exitosamente!"
            redirect_to '/asignaturas'
        else
            flash[:error] = "Hubo un error al editar la asignatura."
            redirect_to '/asignaturas'
        end
    end
    
    def destroy
        @asignatura = Asignatura.find(params[:id])
        @asignatura.destroy
        flash[:success] = "Asignatura eliminada exitosamente!"
        redirect_to '/asignaturas'
    end 
    private
        def asignatura_params
            params.require(:asignatura).permit(:asignaturaID, :nombre)
        end
end
