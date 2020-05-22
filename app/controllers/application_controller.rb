class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	helper_method :current_user_inSession
	
	def current_user_inSession
		current_user
	end
	
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to music_index_path, :alert=>exception.message
	end
end
