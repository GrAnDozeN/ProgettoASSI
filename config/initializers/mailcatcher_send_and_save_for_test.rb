ActionMailer::Base.class_eval do

  def perform_delivery_mailcatcher(mail)
    perform_delivery_smtp(mail)
    perform_delivery_test(mail)
  end

end