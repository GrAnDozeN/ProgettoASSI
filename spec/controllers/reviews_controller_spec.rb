require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

    before(:each) do
        user = User.create({:email => 'as@as.as', :password => 'asasasasas', :roles_mask => 2})
        user.confirm
        sign_in(user)
        login_as(user)
        Music.create({:title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg'})
        Review.create({:musicman => '1', :comments => 'Un commento', :user_id => 1, :music_id => 1})
    end


    describe "Actions" do
        
        
        describe "No record in Review" do

            it "create" do
                post :create, :params => {:review => {:musicman => 1, :comments => "Un commento"}, :music_id => 1}
                expect(assigns(:review)).not_to be_nil
            end

        end

        describe "Review with records" do

            it "show no tracks" do
                get :show, :params => {:music_id => 1, :id => 1}
                expect(assigns(:reviews)).not_to be_nil
            end

            it "destroy" do
                expect(Review.count).to eql(1)
                delete :destroy, :params => {:music_id => 1, :id => 1}
                expect(Review.count).to eql(0)
            end

            it "update" do
                put :update, :params => {:review => {:musicman => 5, :comments => "Commento aggiornato"}, :music_id => 1, :id => 1}
                expect(assigns(:review).comments).to eq("Commento aggiornato")
                expect(assigns(:review).comments).not_to eq("Un commento")
            end
        end
    end
end