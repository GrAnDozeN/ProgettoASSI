class AddNotNullForReview < ActiveRecord::Migration[5.2]
  def self.up
    change_column_null :reviews, :musicman, false
    change_column_null :reviews, :comments, false
    change_column_null :reviews, :user_id, false
    change_column_null :reviews, :music_id, false
  end

  def self.down
    change_column_null :reviews, :musicman, true
    change_column_null :reviews, :comments, true
    change_column_null :reviews, :user_id, true
    change_column_null :reviews, :music_id, true
  end
end
