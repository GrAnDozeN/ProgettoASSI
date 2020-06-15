require "rails_helper"

RSpec.describe "music/show", :type => :view do
    describe "View of the show" do
        before(:each) do
            @track = double("Music",:id => '1',:review => "una review", :title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg', :preview_id => "4ceTCJPLBQBOogseivMuhL")
            @reviews = double("Review", :id => '1', :musicman => 3, :comments => 'Un commento', :user_id =>'1', :music_id => '1')
            allow(@track).to receive(:to_i)
            assign(:music, @track)
            assign(:reviews, [@reviews])

        end

        it "It renders the show view" do
            render
            expect(rendered).to render_template(:show)
        end

        it "It shows the track information" do
            render
            expect(rendered).to match(/titoloB(.*(\n)){4}.*autoreB(.*(\n)){4}.*albumB(.*(\n)){4}.*rock.(.*(\n)){4}.*1990/)
        end

        describe "View the preview" do

            it "It shows the preview for Premium users" do
                user = User.create(:email => "ad@ad.ad", :password => "asdasdasd", :roles_mask => 1, :favorites => [])
                user.confirm
                sign_in(user)
                login_as(user)
                render
                expect(rendered).to match("<iframe allow='encrypted-media' allowtransparency='true' frameborder='1' height='80' id='preview' src='https://open.spotify.com/embed/track/4ceTCJPLBQBOogseivMuhL' width='500'></iframe>")
            end

            it "It does not show the preview for base users" do
                user = User.create(:email => "ad@ad.ad", :password => "asdasdasd", :roles_mask => 0, :favorites => [])
                user.confirm
                sign_in(user)
                login_as(user)
                render
                expect(rendered).not_to match("<iframe allow='encrypted-media' allowtransparency='true' frameborder='1' height='80' id='preview' src='https://open.spotify.com/embed/track/4ceTCJPLBQBOogseivMuhL' width='500'></iframe>")
            end
        end
    end
end