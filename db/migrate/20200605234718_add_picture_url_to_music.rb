class AddPictureUrlToMusic < ActiveRecord::Migration[5.2]
  def self.up
    add_column :musics, :image_url, :string, default: "https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg"
  end

  def self.down
    remove_column :musics, :image_url, :string
  end

end
