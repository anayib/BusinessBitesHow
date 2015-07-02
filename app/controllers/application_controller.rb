class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def course_location
    puts "ñññññññññññññññññññññññññññ"
    puts "I pass through here!"
    if params[:course_id]
      session[:previous_url] = course_path(params[:course_id])
    end
    puts session[:previous_url]
    puts "ññññññññññññññññññññññññññññ"
  end

  def after_sign_in_path_for(user)
  	if user_signed_in? && current_user.sign_in_count == 1
  		welcome_new_user_path
  	else
      puts "~~~~~~~~~~~~~~~~~~"
      puts session[:previous_url]
      puts "~~~~~~~~~~~~~~~~~"
    	session[:previous_url] || root_path
  	end
  end
end
