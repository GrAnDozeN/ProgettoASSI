class ReviewsController < ApplicationController


	def new
		if !user_signed_in?
			redirect_to new_user_session_path()
		end
	end

	def show
		@reviews = Review.where(:music_id=>params[:music_id])
	end
	
	def create
		music_id = params[:music_id]
		user_id = current_user.id
		@music = Music.find(music_id)
		@review = Review.new(params[:review].permit(:musicman, :comments))
		authorize! :create, @review, :message => "Attenzione: Non sei autorizzato a creare una recensione"
		@review.user_id = user_id
		@review.music_id = music_id
		@review.save!
		redirect_to music_path(@music)
	end

	def destroy
		id = params[:music_id]
		@review = Review.find(id)
		authorize! :destroy, @review, :message => "Attenzione: Non sei autorizzato ad eliminare una recensione"
		@review.destroy
		redirect_to music_path(@review.music_id)
	end

	def update
        id = params[:music_id]
		@review = Review.find(id)
		@review.update_attributes!(params[:review].permit(:musicman, :comments))
        redirect_to music_path(@review.music_id)
    end

	def edit
		if !user_signed_in?
			redirect_to new_user_session_path()
		end
		id = params[:music_id]
		@review = Review.find(id)
	end

end
