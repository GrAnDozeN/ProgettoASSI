class Music::FavoritesController < ApplicationController

    def show
		@favorites = current_user.favorites

		@musics = Music.order(params[:sort])		
	end

	def update
		@music = Music.find(params[:id_music])
		if (current_user.favorites.where(music: @music).empty?)
			@favorite = Favorite.create!(:user => current_user, :music => @music)
		end
		redirect_to music_path(@music)
	end

	def destroy
		@music = Music.find(params[:id_music])
		@list = current_user.favorites
		if (!@list.where(music: @music).empty?)
			@list.where(music: @music).destroy_all
		end
        redirect_to music_path(@music)
    end
end
