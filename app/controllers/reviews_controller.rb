class ReviewsController < ApplicationController

	def new
		@currentUser = Musicgoer.find(session[:user_id])
	end

	def show
		@reviews = Review.where(:music_id=>params[:music_id])
	end
	
	def create
		music_id = params[:music_id]
		user_id = session[:user_id]
		@music = Music.find(music_id)
		@review = Review.new(params[:review].permit(:musicman, :comments))
		@review.musicgoer_id = user_id
		@review.music_id = music_id
		@review.save!
		redirect_to music_path(@music)
	end

	def destroy
		id = params[:id]
		@review = @Review.find(id)
		@review.destroy
		redirect_to music_show_path
	end

	def update
        id = params[:music_id]
		@review = Review.find(id)
		@review.update_attributes!(params[:review].permit(:musicman, :comments))
        redirect_to music_path(@review.music_id)
    end

	def edit
		@currentUser = Musicgoer.find(session[:user_id])
		id = params[:music_id]
		@review = Review.find(id)
	end

end
