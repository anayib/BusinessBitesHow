class PagesController < ApplicationController
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
end
