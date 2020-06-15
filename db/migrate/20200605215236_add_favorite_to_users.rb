class AddFavoriteToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.belongs_to :music
    end
  end

  def self.down
    drop_table :favorites
  end
end
