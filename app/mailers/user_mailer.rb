class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Bienvenido a BusinessHackers!')
  end

  def welcome_guest_email(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Bienvenido a BusinessHackers!')
  end

  def welcome_subscriptor_email(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Bienvenido a BusinessHackers VIP!')
  end

  def end_guest_account(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Ha terminado tu periodo de prueba en BusinessHackers!')
  end
end
