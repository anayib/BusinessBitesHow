class TopicsController < ApplicationController
	before_action :authenticate_user!
	before_filter :topic_access

	def show		
		@topic = Topic.find(params[:id])
		course = @topic.lesson.course
		@footer_courses = Course.last(3)
		topics_number = 0
		course.lessons.each do |lesson|
			topics_number+=lesson.topics.count
		end
		topics_done = current_user.topic_completitions.where(course_id: course.id).count
		@progress = (topics_done*100) / topics_number
	end

	private
		def topic_access
			if Topic.find(params[:id]).lesson.course.with_charge?
				unless current_user.vip_user? || current_user.admin? || current_user.content_manager?
					redirect_to root_path, :alert => "Lo sentimos, usted no posee una cuenta VIP, por lo tanto no puede ver el topic: #{Topic.find(params[:id]).title}."
				end
			end
		end
end