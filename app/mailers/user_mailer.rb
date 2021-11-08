class UserMailer < ApplicationMailer
  default from: 'no-reply@evenementeur.fr'
  
  def welcome_email(user)
    @user = user
    @url = 'https://evenementeur.com/login'
    mail(from: ENV['EMAIL_FROM'], to: @user.email, subject: 'Bienvenue !')
  end
end
