class ValidateMusic < ActiveRecord::Migration[5.2]
  def self.up
    change_column_null :musics, :title, false
    change_column_null :musics, :author, false
    change_column_null :musics, :album, false
    change_column_null :musics, :genre, false
    change_column_null :musics, :year, false
  end

  def self.down
    change_column_null :musics, :title, true
    change_column_null :musics, :author, true
    change_column_null :musics, :album, true
    change_column_null :musics, :genre, true
    change_column_null :musics, :year, true
  end
end