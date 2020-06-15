require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before(:each) do
    User.create({:email => 'as@as.as', :password => 'asasasasas'}).confirm
    Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
  end

  context 'operation in Model' do
    it 'Has no record at the beggining' do
      expect(Favorite.count).to eq(0)
    end

    it 'Has one record after adding one', :focus => true do
      Favorite.create({:user_id => 1, :music_id => 1})
      expect(Favorite.count).to eq(1)
      expect(Favorite.count).not_to eq(0)
    end

    it 'Has no record after adding one and deleting it' do
      Favorite.create({:user_id => 1, :music_id => 1})
      Favorite.find(1).destroy
      expect(Favorite.count).to eq(0)
      expect(Favorite.count).not_to eq(1)
    end
  end

  context 'Columns not null tests', :focus => true do

    it 'can not create the Favorite with only the user_id' do
      expect(Favorite.new(user_id: 1).save).to be false
    end

    it 'can not create the Favorite with only the music_id' do
      expect(Favorite.new(music_id: 1).save).to be false
    end
    
    it 'ensures the Favorite is created successfully' do
      expect(Favorite.new(:user_id => 1, :music_id => 1).save).not_to be false
    end
  end
end
