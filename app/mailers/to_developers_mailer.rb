class ToDevelopersMailer < ApplicationMailer

    def toDev
        @user = params[:user]
        @type = params[:type]
        @msg = params[:msg]
        subject = "Musicman mail -> " + @type + " (from: " + @user.email + ")"
        mail(from: @user.email, to: "testing@developers.mail", subject: subject)
    end
end