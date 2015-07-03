class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def course_location
    if params[:course_id]
      session[:previous_url] = course_path(params[:course_id])
    end
  end

  def after_sign_in_path_for(user)
    if (params.has_key?(:course_id))
      course = Course.find(params[:course_id]) if params[:course_id]
    end
  	if user_signed_in? && current_user.sign_in_count == 1
      ####
      # unless params[:course_id].empty?
      #   if course.course_type == "with_charge"
      #     new_subscription_path(:subscription_plan => params[:subscription_plan])
      #   else
      # 		welcome_new_user_path
      #   end
      # else
      #   if params[:subscription] == true
      #     new_subscription_path
      #   else
      #     welcome_new_user_path
      #   end
      # end
      ####
      if (params.has_key?(:course_id))
        if course.course_type == "with_charge"
          new_subscription_path(:subscription_plan => params[:subscription_plan])
        else
          welcome_new_user_path
        end
      else
        if (params.has_key?(:subscription))
          new_subscription_path
        else
          welcome_new_user_path
        end
      end
      ####
  	else
    	session[:previous_url] || root_path
  	end
  end
end
