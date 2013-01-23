class UserMailer < ActionMailer::Base
  default from: "pansingh@weboniselab.com"
  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome " )
  end

end
