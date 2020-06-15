require "rails_helper"

RSpec.describe "music/index", :type => :view do
    describe "View of index.html" do
        before(:each) do
            @track1 = double("Music", :title => 'titoloB', :author => 'autoreB', :album => 'albumB' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg')
            @track2 = double("Music", :title => 'titoloA', :author => 'autoreA', :album => 'albumA' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg')
            @track3 = double("Music", :title => 'titoloC', :author => 'autoreB', :album => 'albumC' , :genre => 'rock', :year => '1990', :image_url => 'https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg')
        end

        it "renders the index view" do
            assign(:musics, [@track1])
            render
            expect(rendered).to render_template(:index)
        end

        it "display a track" do
            assign(:musics, [@track1])
            render
            expect(rendered).to match(/titoloB.*(\n)?.*autoreB.*(\n)?.*albumB.*(\n)?.*rock.*(\n)?.*1990/)
        end

        it "sorts by name" do
            @list = [@track1, @track2, @track3]
            allow(@list).to receive(:sort).and_return(@list.sort_by{|x| x.title})
            assign(:musics, @list.sort)
            render
            expect(rendered).to match(/titoloA(.*(\n)*){9}.*titoloB(.*(\n)*){9}.*titoloC/)        
        end

        it "finds the searched track" do
            @list = [@track1, @track2, @track3]
            allow(@list).to receive(:select).and_return(@list.select{|x| x.title == "titoloA" })
            assign(:musics, @list.select)
            render
            expect(rendered).to match(/titoloA/)
        end
    end

    describe "Interaction with controller" do
        it "interact with controller Music" do
            expect(controller.controller_path).to eq("music")
        end

        it "interact with action Index of controller Music" do
            expect(controller.controller_path).to eq("music")
            expect(controller.request.path_parameters[:action]).to eq("index")
        end
    end
end 