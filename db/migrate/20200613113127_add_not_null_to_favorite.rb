class AddNotNullToFavorite < ActiveRecord::Migration[5.2]
  def self.up
    change_column_null :favorites, :user_id, false
    change_column_null :favorites, :music_id, false
  end

  def self.down
    change_column_null :favorites, :user_id, true
    change_column_null :favorites, :music_id, true
  end
end
