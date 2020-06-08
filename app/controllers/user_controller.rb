class UserController < ApplicationController
    before_action :is_admin? 

    def is_admin?
        redirect_to music_index_path unless current_user.admin?
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])      
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to user_index_path
    end    

    def update
        @user = User.find(params[:id])
        @user.update_attributes!(params.permit(:roles_mask))
        redirect_to user_index_path
    end

end
