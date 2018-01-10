class UserMailer < ApplicationMailer
  default from: 'noreply@bicycle.com'

  def welcome_email(user, password)
    @user = user
    @password = password
    @url  = "http://#{user.locale}.board.dev:3000/auth/login"
    mail(to: @user.email, subject: 'Добро пожаловать на bicycle.com')
  end
end
