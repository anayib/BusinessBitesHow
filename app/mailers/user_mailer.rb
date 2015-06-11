class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://www.businessbites.how/'
    mail(to: @user.email, subject: 'Bienvenido a Business Bites')
  end
end
