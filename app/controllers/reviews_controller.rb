class ReviewsController < ApplicationController

	def new
	end

	def show
		@reviews = Review.where(:music_id=>params[:music_id])
	end
	
	def create
		music_id = params[:music_id]
		user_id = session[:user_id]
		@music = Music.find(music_id)
		@review = Review.new(params[:review].permit(:musicman, :comments))
		authorize! :create, @review, :message => "Attenzione: Non sei autorizzato a creare una recensione"
		@review.musicgoer_id = user_id
		@review.music_id = music_id
		@review.save!
		redirect_to music_path(@music)
	end

	def destroy
		id = params[:id]
		@review = @Review.find(id)
		authorize! :destroy, @review, :message => "Attenzione: Non sei autorizzato ad eliminare una recensione"
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
		id = params[:music_id]
		@review = Review.find(id)
	end

end
