class MusicController < ApplicationController
skip_before_action :verify_authenticity_token

	def index
		@musics = Music.all
		@currentUser = Musicgoer.find(session[:user_id])
	end

	def create
		if !(Music.exists?(:title=>params[:music][:title], :author=>params[:music][:author], :genre=>params[:music][:genre], :year=>params[:music][:year]))
			@music = Music.create!(params[:music].permit(:title,:author,:album,:genre,:year))
			redirect_to music_path(@music)
		else
			redirect_to music_index_path
		end
	end

	def show
		@currentUser = Musicgoer.find(session[:user_id])
        id = params[:id]
        if Music.exists?(id)
        		@music = Music.find(id)
        else
        render html: 'Track does not exit'
        end
	end

	def new
		@currentUser = Musicgoer.find(session[:user_id])
	end

	def destroy
		id = params[:id]
		@music = Music.find(id)
		@music.destroy
		redirect_to music_index_path
	end

	def update
        id = params[:id]
		@music = Music.find(id)
		@music.update_attributes!(params[:music].permit(:title, :author, :album, :genre, :year))
        redirect_to music_path(@music)
    end

	def edit
		@currentUser = Musicgoer.find(session[:user_id])
		id = params[:id]
		@music = Music.find(id)
	end
end
