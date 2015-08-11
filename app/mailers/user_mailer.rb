class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Bienvenido a Business Hackers!')
  end

  def welcome_guest_email(user)
    @user = user
    @deaddate = Time.now + @user.vip_days.days
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: "Hola #{@user.name}, te damos la bienvenida a  BusinessHackers!")
  end

  def welcome_subscriptor_email(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Bienvenido a Business Hackers VIP!')
  end

  def end_guest_account(user)
    @user = user
    @url  = 'http://www.businesshackers.how/'
    mail(to: @user.email, subject: 'Ha caducado tu suscripción a Business Hackers')
  end
end
