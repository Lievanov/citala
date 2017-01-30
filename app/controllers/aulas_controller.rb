class AulasController < ApplicationController
    def new
        @aula = Aula.new
        @Users = User.where(rol: 'Profesor')
    end
    def create
        @aula = Aula.new(aula_params)
        if @aula.save
            flash[:success] = "Aula guardada exitosamente!"
            redirect_to '/aulas'
        else
            flash[:error] = "Hubo un error al almacenar el Aula."
            redirect_to '/aulas'
        end
    end
    def show
        @aulas = Aula.all
    end
    def edit
        @aula = Aula.find(params[:id])
        @Users = User.where(rol: 'Profesor')
    end
    def update
        @aula = Aula.find(params[:id])
        if @aula.update(aula_params)
            flash[:success] = "Aula editada exitosamente!"
            redirect_to '/aulas'
        else
            flash[:error] = "Hubo un error al editar el aula."
            redirect_to '/aulas'
        end
    end
    def destroy
        @aula = Aula.find(params[:id])
        @aula.destroy
        flash[:success] = "Aula eliminada exitosamente!"
        redirect_to '/aulas'
    end 
    private
        def aula_params
            params.require(:aula).permit(:aulaID, :profesorID, :grado, :actual)
        end
end
