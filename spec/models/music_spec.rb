require 'rails_helper'

RSpec.describe Music, type: :model do
  context 'operation in Model' do
    it 'Has no record at the beggining' do
      expect(Music.count).to eq(0)
    end

    it 'Has one record after adding one' do
      Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
      expect(Music.count).to eq(1)
      expect(Music.count).not_to eq(0)
    end

    it 'Has no record after adding one and deleting it' do
      Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
      Music.find(1).destroy
      expect(Music.count).to eq(0)
      expect(Music.count).not_to eq(1)

    end

    it 'Has updated record after adding one and updating it' do
      Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
      Music.update(1, :title => 'titoloAggiornato')
      expect(Music.find(1).title).to eq('titoloAggiornato')
      expect(Music.find(1).title).not_to eq('titoloB')
    end
  end

  context 'Columns not null in tracks' do
    it 'can not create the track with only the title' do
      expect{Music.new(title: 'Titolo').save}.to raise_error(ActiveRecord::NotNullViolation)
    end
    
    it 'can not create the track with only the author' do
      expect{Music.new(author: "Autore").save}.to raise_error(ActiveRecord::NotNullViolation)
    end

    it 'can not create the track with only the album' do
      expect{Music.new(album: 'Album').save}.to raise_error(ActiveRecord::NotNullViolation)
    end

    it 'can not create the track with only the genre' do
      expect{Music.new(genre: 'Rock').save}.to raise_error(ActiveRecord::NotNullViolation)
    end

    it 'can not create the track with only the year' do
      expect{Music.new(year: '1990').save}.to raise_error(ActiveRecord::NotNullViolation)
    end
    
    it 'ensures the track is created successfully' do
      expect{Music.new(title: 'Titolo', author: "Autore", album: 'Album', genre: 'Rock', year: '1990').save}.not_to raise_error
    end
  end

end