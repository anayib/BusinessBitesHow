class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
  	if user_signed_in? && current_user.sign_in_count == 1
  		welcome_new_user_path
  	else
    	root_path
  	end
  end
end
