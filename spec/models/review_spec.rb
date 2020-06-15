require 'rails_helper'

RSpec.describe Review, type: :model do
  before(:each) do
    User.create({:email => 'as@as.as', :password => 'asasasasas'}).confirm
    Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
  end

  context 'operation in Model' do
    it 'Has no record at the beggining' do
      expect(Review.count).to eq(0)
    end

    it 'Has one record after adding one', :focus => true do
      Review.create({:musicman => '1', :comments => 'Un commento', :user_id => 1, :music_id => 1})
      expect(Review.count).to eq(1)
      expect(Review.count).not_to eq(0)
    end

    it 'Has no record after adding one and deleting it' do
      Review.create({:musicman => '1', :comments => 'Un commento', :user_id => 1, :music_id => 1})
      Review.find(1).destroy
      expect(Review.count).to eq(0)
      expect(Review.count).not_to eq(1)
    end

    it 'Has updated record after adding one and updating it' do
      Review.create({:musicman => '1', :comments => 'Un commento', :user_id => 1, :music_id => 1})
      Review.update(1, :comments => 'commentoAggiornato')
      expect(Review.find(1).comments).to eq('commentoAggiornato')
      expect(Review.find(1).comments).not_to eq('Un commento')
    end
  end

  context 'Columns not null tests', :focus => true do
    it 'can not create the review with only the musicman' do
      expect(Review.new(musicman: '3').save).to be false
    end
    
    it 'can not create the review with only the comments' do
      expect(Review.new(comments: "Comment casual").save).to be false
    end

    it 'can not create the review with only the user_id' do
      expect(Review.new(user_id: 1).save).to be false
    end

    it 'can not create the review with only the music_id' do
      expect(Review.new(music_id: 1).save).to be false
    end
    
    it 'ensures the review is created successfully' do
      expect(Review.new(:musicman => '1', :comments => 'Un commento', :user_id => 1, :music_id => 1).save).not_to be false
    end
  end
end