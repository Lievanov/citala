class UsersController < ApplicationController
    def show
        @users = User.where(rol: nil)
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "Usuario eliminado exitosamente!"
        redirect_to '/AceptarUsuarios'
    end
    def edit
        begin
            @Users = User.where(rol: 'Profesor')
            @users = User.find(params[:users_ids])
        rescue
            flash[:error] = "Debe seleccionar al menos un alumno para editar!"
            redirect_to '/AceptarUsuarios'
        end
    end
    def update
        User.update(params[:users].keys, params[:users].values)
        flash[:success] = "Usuarios editados exitosamente!"
        redirect_to '/AceptarUsuarios'
    end
    
    def configuracion
        
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :rol, :carnet, :profesorID, :grado, :foto, :fecha_nac, :Centro_esc_ant, :religion, 
        :colonia, :departamento, :municipio, :barrio, :tel_casa, :enfermedades, :nombre_padre, :tel_padre, :correo_padre, :ocupacion_padre,
        :lugar_trabajo_padre, :nombre_madre, :tel_madre, :correo_madre, :ocupacion_madre, :lugar_trabajo_madre, :nombre_enc, :tel_enc, 
        :correo_enc, :en_caso_emergencia, :tel_emergencia, :activo) 
    end
end
