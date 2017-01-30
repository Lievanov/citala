class CreateAsignaturas < ActiveRecord::Migration
  def change
    create_table :asignaturas do |t|
      t.string :asignaturaID
      t.string :nombre
      t.timestamps null: false
    end
  end
end
