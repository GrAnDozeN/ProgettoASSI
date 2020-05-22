class MusicController < ApplicationController
skip_before_action :verify_authenticity_token
	before_action :authenticate_user!

	def index
		@musics = Music.all
	end

	def create
		if !(Music.exists?(:title=>params[:music][:title], :author=>params[:music][:author], :genre=>params[:music][:genre], :year=>params[:music][:year]))
			@music = Music.create!(params[:music].permit(:title,:author,:album,:genre,:year))
			authorize! :create, @music, :message => "Attenzione: Non sei autorizzato a creare nuovi brani"
			redirect_to music_path(@music)
		else
			redirect_to music_index_path
		end
	end

	def show
        id = params[:id]
        if Music.exists?(id)
				@music = Music.find(id)
				@reviews = Review.where(:music_id=>id)
        else
        render html: 'Track does not exit'
        end
	end

	def new
	end

	def destroy
		id = params[:id]
		@music = Music.find(id)
		authorize! :destroy, @music, :message => "Attenzione: Non sei autorizzato ad eliminare brani"
		@music.destroy
		redirect_to music_index_path
	end

	def update
        id = params[:id]
	@music = Music.find(id)
	authorize! :update, @music, :message => "Attenzione: Non sei autorizzato ad aggiornare brani"
	@music.update_attributes!(params[:music].permit(:title, :author, :album, :genre, :year))
        redirect_to music_path(@music)
    end

	def edit
		id = params[:id]
		@music = Music.find(id)
		authorize! :update, @music
	end
end
