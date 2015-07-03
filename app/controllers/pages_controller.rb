class PagesController < ApplicationController
	before_filter :course_location
	before_action :authenticate_user!, :only => [:welcome_video_user,:welcome_video_subscriptor]
	before_action :has_subscription?, :only => [:welcome_video_subscriptor]

	def home
		@courses = Course.all
		@footer_courses = Course.last(3)
	end

	def course_information
		@course = Course.find(params[:course_id])
		@instructors = @course.instructors
		@footer_courses = Course.last(3)
		@topic = @course.lessons.first.topics.first
	end

	def welcome_video_user
		@previous_url = session[:previous_url]
	end

	def welcome_video_subscriptor
		@previous_url = session[:previous_url]
	end

	private
		def has_subscription?
	    unless current_user.subscription
	      redirect_to root_path, :alert => "Acceso denegado, no posee ninguna subscripcion actual para acceder a este contenido"
	    end
	  end
end
