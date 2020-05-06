class ReviewsController < ApplicationController

	def new
		
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

end
