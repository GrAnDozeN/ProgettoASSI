class OtherController < ApplicationController
    
    def about        
        @dev01 = {:name => "Christian Realin", :surname => "Ramilo", :pic => "https://www.kindpng.com/picc/b/11/113191.png", :description => "Christian Realin Ramilo"}
        @dev02 = {:name => "Giovanni", :surname => "Giunti", :pic => "https://www.kindpng.com/picc/b/11/113191.png", :description => "Giovanni Giunti"}
        @dev03 = {:name => "Giancarlo", :surname => "Liu", :pic => "https://www.kindpng.com/picc/b/11/113191.png", :description => "Giancarlo Liu"}
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
