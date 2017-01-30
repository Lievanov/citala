class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :email
      t.string :rol
      t.string :carnet
      t.string :profesorID
      t.string :grado
      t.string :foto
      t.date :fecha_nac
      t.string :Centro_esc_ant
      t.string :religion
      t.string :colonia
      t.string :departamento
      t.string :municipio
      t.string :barrio
      t.string :tel_casa
      t.string :enfermedades
      t.string :nombre_padre
      t.string :tel_padre
      t.string :correo_padre
      t.string :ocupacion_padre
      t.string :lugar_trabajo_padre
      t.string :nombre_madre
      t.string :tel_madre
      t.string :correo_madre
      t.string :ocupacion_madre
      t.string :lugar_trabajo_madre
      t.string :nombre_enc
      t.string :tel_enc
      t.string :correo_enc
      t.string :en_caso_emergencia
      t.string :tel_emergencia
      t.string :activo
      t.timestamps null: false
    end
  end
end

