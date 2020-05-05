class SessionsController < ApplicationController

	skip_before_action :set_current_user

	def login
		
	end

	def create
		name = params[:user][:name]
		pass = params[:user][:password]
		@users = Musicgoer.where(:name => name, :password => pass)
		if @users.length>0
			session[:user_id]=@users.ids[0]
			redirect_to music_index_path
		else
			redirect_to login_path
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end

end
