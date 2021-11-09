class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://evenementeur.com/login'
    mail(from: ENV['EMAIL_FROM'], to: @user.email, subject: 'Bienvenue !')
  end

  def attendance_email(attendance)
    @event = attendance.event
    @participant = attendance.user
    mail(
      from: ENV['EMAIL_FROM'],
      to: @event.admin.email,
      subject: "Nouvelle participation à l'événement #{@event.title} 🎉"
    )
  end
end
