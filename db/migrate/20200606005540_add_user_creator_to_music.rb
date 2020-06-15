class AddUserCreatorToMusic < ActiveRecord::Migration[5.2]
  def self.up
    add_belongs_to :musics, :user, index: true
  end

  def self.down
    remove_belongs_to :musics, :user, index: true
  end
end
