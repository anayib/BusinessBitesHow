class TopicCompletitionController < ApplicationController
	before_action :authenticate_user!

	def mark_as_done		
		topic = Topic.find(params[:topic_id])		
		lesson = topic.lesson
		course_id = topic.lesson.course.id
		if TopicCompletition.where(user_id: current_user.id, topic_id: topic.id, course_id: course_id).empty?
			topic_completition = TopicCompletition.create(user_id: current_user.id, topic_id: topic.id, course_id: course_id)
		end
		lesson_ids = topic.lesson.course.lessons.pluck(:id)
		puts "#{lesson_ids}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		topic_ids = lesson.topics.pluck(:id)
		lesson_index = lesson_ids.index(lesson.id)
		topic_index = topic_ids.index(topic.id)
		if topic_index == (topic_ids.length-1)
			redirect_to topic.lesson.course
			if lesson_index == (lesson_ids.length-1)
				flash[:notice] = "FELICITACIONES!, Haz completado con exito el curso: #{topic.lesson.course.title}"
			else
				flash[:notice] = "¡Haz completado con exito la Lesson número #{lesson_index+1}, continua con la Lesson #{lesson_index+2}: #{Lesson.find(lesson_ids[lesson_index+1]).title}"
			end
		else
			redirect_to Topic.find(topic_ids[topic_index+1])
		end		
	end
end
