class CreateMusicgoers < ActiveRecord::Migration[5.2]
  def change
    create_table :musicgoers do |t|
      t.string :name
      t.string :password
      t.string :provider
      t.string :string
      t.string :uid
      t.string :string

      t.timestamps
    end
  end
end
