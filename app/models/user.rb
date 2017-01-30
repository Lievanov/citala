class User < ActiveRecord::Base
    mount_uploader :foto, FotoAlumnoUploader # Tells rails to use this uploader for this model.
    ROLES = ["Alumno", "Profesor", "Administrador"]
    validates :name, presence: true # Make sure the owner's name is present.
    
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            user.save!
        end
    end
    
    def alumno?
        self.rol == 'Alumno'
    end
      
    def profesor?
        self.rol == 'Profesor'
    end
    
    def administrador?
        self.rol == 'Administrador'
    end
end
