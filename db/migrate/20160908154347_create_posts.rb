class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :contenido
      t.string :foto
      t.timestamps null: false
    end
  end
end
