class CreateHoras < ActiveRecord::Migration
  def change
    create_table :horas do |t|
      t.string :titulo
      t.string :url
      t.timestamps null: false
    end
  end
end
