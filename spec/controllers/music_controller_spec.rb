require 'rails_helper'

RSpec.describe MusicController, type: :controller do
    describe "Get index" do
        before(:each) do
            get :index
        end

        it "Display index page" do
            expect(response).to render_template(:index)
        end

        it "Return a HTTP Status = 200" do
            expect(response.status).to eq(200)
        end
    end

    describe "Tracks variable [no records in database]" do
        it "Return no track" do
            get :index
            expect(assigns(:musics)).to be_empty
        end
    end
    
    describe "Tracks variable" do
        before(:each) do
            Music.new(title: 'b', author: "same", album: 'b', genre: 'b', year: '1990').save
            Music.new(title: 'a', author: "same", album: 'a', genre: 'Rock', year: '1990').save
            Music.new(title: 'c', author: "c", album: 'c', genre: 'c', year: '1990').save
            @track1 = Music.find(1)
            @track2 = Music.find(2)
            @track3 = Music.find(3)
        end

        it "All tracks" do
            get :index
            expect(assigns(:musics)).to eq([@track1,@track2,@track3])
        end

        it "Sort all tracks" do
            get :index, :params => {:sort => "title"}
            expect(assigns(:musics)).to eq([@track2,@track1,@track3])
        end

        it "Search a track" do
            get :index, :params => {:search => "c", :type => "Artist"}
            expect(assigns(:musics)).to eq([@track3])
        end

        it "Sort a searched tracks" do
            get :index, :params => {:search => "same", :type => "Artist", :sort => "title"}
            expect(assigns(:musics)).to eq([@track2, @track1])
        end

    end







    describe "Interaction with Spotify API" do
        before(:each) do
            user = User.create(:email => "ad@ad.ad", :password => "asdasdasd")
            user.confirm
            sign_in(user)
            login_as(user)
        end

        it "Search with the Spotify API the ID for the album and add it in the track record during adding a track" do
            post :create, :params => {:music => {:title => "prova", :author => 'artista', :genre => 'rock', :year => '1990', :album => 'album'}}
            expect(assigns(:response)).not_to be_nil
            expect(assigns(:music)).not_to be_nil
            expect{response}.not_to raise_error
        end

        it "Exists the ID for the preview for a track found be Spotify API" do
            post :create, :params => {:music => {:title => "Ancestral", :author => 'Steven Wilson', :genre => 'rock', :year => '2015', :album => 'Hand Cannot Erase'}}
            get :show, :params => {:id => "1"}
            expect(assigns(:music).preview_id).not_to be_nil
        end

        it "Not exists the ID for the preview for a track not found be Spotify API" do
            post :create, :params => {:music => {:title => "TracciaNonEsistente", :author => 'Steven Wilson', :genre => 'rock', :year => '2015', :album => 'Hand Cannot Erase'}}
            get :show, :params => {:id => "1"}
            expect(assigns(:music).preview_id).to be_nil
        end
    end
end
