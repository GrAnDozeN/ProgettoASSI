class AddPreviewUrlToMusic < ActiveRecord::Migration[5.2]
  def self.up
    add_column :musics, :preview_id, :string
  end

  def self.down
    remove_column :musics, :preview_id, :string
  end
end
