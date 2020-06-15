require 'rails_helper'

RSpec.describe Music::FavoritesController, type: :controller do

    before(:each) do
        user = User.create({:email => 'as@as.as', :password => 'asasasasas', :roles_mask => 2})
        user.confirm
        sign_in(user)
        login_as(user)
        Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
        Favorite.create({:user_id => 1, :music_id => 1})
    end


    describe "Actions" do

        describe "Favorite with records" do

            it "show no favorite" do
                get :show
                expect(assigns(:favorites)).not_to be_nil
            end

            it "destroy" do
                expect(Favorite.count).to eql(1)
                delete :destroy, :params => {:id_music => 1}
                expect(Favorite.count).to eql(0)
            end

            it "update exist track" do
                put :update, :params => {:id_music => 1}
                expect(assigns(:favorite)).to be_nil
            end

            it "update not exist track" do
                delete :destroy, :params => {:id_music => 1}
                put :update, :params => {:id_music => 1}
                expect(assigns(:favorite)).not_to be_nil
            end
        end
    end
end