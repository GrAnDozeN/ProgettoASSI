class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :author
      t.string :album
      t.string :genre
      t.string :year

      t.timestamps
    end
  end
end
