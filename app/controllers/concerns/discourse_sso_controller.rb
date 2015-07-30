require 'single_sign_on'

class DiscourseSsoController < ApplicationController
  before_action :authenticate_user! # ensures user must login

  def sso
    if current_user.user?
      flash[:alert] = "Debes tener una cuenta VIP para tener acceso a la comunidad de Business Hackers."
      redirect_to root_path
    else
      secret = "f723977830ae30d3ed7cd126ac5ab146fee09c3bf6c7a0ebb744007c3a19b057"
      sso = SingleSignOn.parse(request.query_string, secret)
      sso.email = current_user.email # from devise
      sso.name = current_user.name # this is a custom method on the User class
      sso.username = current_user.email # from devise
      sso.external_id = current_user.id # from devise
      sso.sso_secret = secret

      redirect_to sso.to_url("http://104.131.188.13/session/sso_login")
    end
  end
end