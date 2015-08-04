class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = 'http://www.businessbites.how/'
    mail(to: @user.email, subject: 'Bienvenido a BusinessHackers!')
  end

  def welcome_subscriptor_email(user)
    @user = user
    @url  = 'http://www.businessbites.how/'
    mail(to: @user.email, subject: 'Bienvenido a BusinessHackers VIP!')
  end

end
