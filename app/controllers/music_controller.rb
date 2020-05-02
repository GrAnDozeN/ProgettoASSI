class MusicController < ApplicationController
skip_before_action :verify_authenticity_token

	def index
		@musics = Music.all
	end

	def create
		@music = Music.create!(params[:music].permit(:title,:author,:album,:genre,:year))
		redirect_to music_path
	end

	def show
        	id = params[:id]
        	if Music.exists?(id)
            		@music = Music.find(id)
        	else
           	render html: 'Track does not exit'
        	end
	end

	def new
	end

	def destroy
		id = params[:id]
		@music = Music.find(id)
		@music.destroy
		redirect_to music_path(@music)
	end

	def update
		if Music.exists?(id = params[:id])
			@music = Music.find(id)
			@music.update_attributes!(params[:music].permit(:title, :author, :album, :genre, :year))
			redirect_to music_path(@music)
		else
			@music = Music.create!(params[:music].permit(:title,:author,:album,:genre,:year)) # RISOLVERE LA REDIRECT (UPDATE
			redirect_to music_path(@music)							  # INVECE DI NEW)
		end
	end

	def edit
		id = params[:id]
		@music = Music.find(id)
	end
end
