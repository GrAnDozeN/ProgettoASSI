require 'rails_helper'

RSpec.describe "Musics", type: :request do
    describe "GET index" do
        it "Display the tracks" do
            #get :index
            @musics = Music.all
            expect(response).to render_template(:index)
        end
    end

end
