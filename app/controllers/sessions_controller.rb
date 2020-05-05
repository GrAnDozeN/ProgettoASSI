class SessionsController < ApplicationController

	skip_before_action :set_current_user

	def login
		
	end

	def create
		name = params[:user][:name]
		@users = Musicgoer.where(:name => name)
		if @users.length>0
			session[:user_id]='1'
			redirect_to music_index_path
		else
			redirect_to login_path
		end
	end

	def destroy
		session.delete(:user_id)
	end

end
