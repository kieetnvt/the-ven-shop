class UserMailer < ActionMailer::Base
  default from: "nvtuankiet324@gmail.com"
  def welcome_email(user)
  	@user = user
  	@url = "http://localhost:3000"
  	mail(to: @user.email, subject: 'Welcome to My Site')
  end
  def checkout_confirm(user)
  	@user = user
  	mail(:to => @user.email, :subject => "Thank for purchasing")
  		
  end
end
