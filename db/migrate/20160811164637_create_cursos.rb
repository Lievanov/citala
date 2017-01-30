class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :cursoID
      t.string :asignaturaID
      t.string :profesorID
      t.string :aulaID
      t.string :horario
      t.boolean :activo
      t.timestamps null: false
    end
  end
end
