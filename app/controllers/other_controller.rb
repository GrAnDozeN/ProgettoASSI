class OtherController < ApplicationController
    
    def about        
        @dev01 = {:name => "name", :surname => "surname", :pic => "https://www.kindpng.com/picc/b/11/113191.png"}
        @dev02 = {:name => "name", :surname => "surname", :pic => "https://www.kindpng.com/picc/b/11/113191.png"}
        @dev03 = {:name => "name", :surname => "surname", :pic => "https://www.kindpng.com/picc/b/11/113191.png"}
        @listDev = [@dev01, @dev02, @dev03]
    end

    def contact
        if (!user_signed_in?)
            redirect_to new_user_session_path
        else
            if (!(params[:initChoice].nil? || params[:initChoice].false?))
                @initSelect = params[:initChoice]
            end
        end
    end

    def sendMail
        if (!user_signed_in?)
            redirect_to new_user_session_path
        end
        type = params[:send][:msgType]
        msg = params[:send][:msg]
        ToDevelopersMailer.with(type: type, msg: msg, user:current_user).toDev.deliver_now
        redirect_to about_path
    end

end