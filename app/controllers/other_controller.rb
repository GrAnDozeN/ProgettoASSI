class OtherController < ApplicationController

    @dev01 = {:name => "name", :surname => "surname", :pic => "https://www.kindpng.com/picc/b/11/113191.png"}
    @dev02 = {:name => "name", :surname => "surname", :pic => "https://www.kindpng.com/picc/b/11/113191.png"}
    @dev03 = {:name => "name", :surname => "surname", :pic => "https://www.kindpng.com/picc/b/11/113191.png"}
    
    def about        
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
#
    #def send
#
    #end

end
