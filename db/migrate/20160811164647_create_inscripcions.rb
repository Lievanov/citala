class CreateInscripcions < ActiveRecord::Migration
  def change
    create_table :inscripcions do |t|
      t.string :cursoID
      t.string :alumnoID
      t.integer :periodo
      t.float :eval1, :default => 0.0
      t.float :eval2, :default => 0.0
      t.float :eval3, :default => 0.0
      t.float :eval4, :default => 0.0
      t.float :eval5, :default => 0.0
      t.float :eval6, :default => 0.0
      t.float :eval7, :default => 0.0
      t.float :eval8, :default => 0.0
      t.float :eval9, :default => 0.0
      t.float :nota_periodo, :default => 0.0
      t.boolean :activo
      t.timestamps null: false
    end
  end
end
