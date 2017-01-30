class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.string :aulaID
      t.string :profesorID
      t.string :grado
      t.boolean :actual
      t.timestamps null: false
    end
  end
end
