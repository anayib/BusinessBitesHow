class TopicCompletitionController < ApplicationController
	before_action :authenticate_user!

	def mark_as_done	
		# Topic actual	
		topic = Topic.find(params[:topic_id])	
		#	Lesson Actual
		lesson = topic.lesson
		# Id del curso
		course_id = topic.lesson.course.id
		# Find course
		course = Course.find(course_id)		
		# Number of topics, find the total of topics from the course
		course_topics = 0
		course.lessons.each do |lesson|
			course_topics+=lesson.topics.count
		end
		puts "ESTE CURSO TIENE: #{course_topics} TOPICS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# Validar que el topic ya se haya realizado		
		if TopicCompletition.where(user_id: current_user.id, topic_id: topic.id, course_id: course_id).empty?
			# En caso de que el topic no se haya realizado crear un nuevo registro de topic completition
			topic_completition = TopicCompletition.create(user_id: current_user.id, topic_id: topic.id, course_id: course_id)
		end
		# IDs de los lesson	del curso
		lesson_ids = topic.lesson.course.lessons.pluck(:id)
		puts "#{lesson_ids}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# IDs de topics pertenecientes al lesson
		topic_ids = lesson.topics.pluck(:id)
		# Buscar index del lesson actual
		lesson_index = lesson_ids.index(lesson.id)
		# Buscar index del topic actual
		topic_index = topic_ids.index(topic.id)
		if topic_index == (topic_ids.length-1)
			# Termino lesson y lo envia de nuevo a la pantalla del curso
			redirect_to topic.lesson.course
			if (lesson_index == (lesson_ids.length-1)) && (TopicCompletition.where(user_id: current_user.id, course_id: course_id).count==course_topics)
				# Si es el ultimo lesson y ha terminado todos los topics del curso, lo envia al home del curso con mensaje flash de felicitaciones
				flash[:notice] = "FELICITACIONES!, Has completado con exito el curso: #{topic.lesson.course.title}"
			elsif (lesson_index == (lesson_ids.length-1)) && (TopicCompletition.where(user_id: current_user.id, course_id: course_id).count!=course_topics)
				# Si es el ultimo lesson pero no ha terminado todos los topics del curso, lo envia al home del curso con mensaje flash de aviso para completar topics
				flash[:alert] = "¡Has completado con éxito el Topic: #{topic.title}, sin embargo aun debes completar topics anteriores a este, para marcar este curso como completado"
			elsif TopicCompletition.where(user_id: current_user.id, topic_id: topic_ids).count == topic_ids.count
				# Si no es el ultimo lesson y ha terminado todos los topics de este, lo envia al home del curso con mensaje flash e información para tomar el siguiente lesson
				flash[:notice] = "¡Has completado con exito la Lesson número #{lesson_index+1}, continua con la Lesson #{lesson_index+2}: #{Lesson.find(lesson_ids[lesson_index+1]).title}"				
			elsif TopicCompletition.where(user_id: current_user.id, topic_id: topic_ids).count != topic_ids.count
				# Si no es el ultimo lesson pero no ha terminado todos los topics de este, lo envia al home del curso con mensaje flash de aviso para completar topics
				flash[:alert] = "¡Has completado con éxito el Topic: #{topic.title}, sin embargo aun debes completar topics anteriores a este, para marcar la lesson #{topic.lesson.title} como completa"								
			end
		elsif TopicCompletition.where(user_id: current_user.id, course_id: course_id).count == course_topics
			redirect_to topic.lesson.course
			# Si no es el ultimo lesson pero ha terminado todos los topics del curso, lo envia al home del curso con mensaje flash de felicitaciones
			flash[:notice] = "FELICITACIONES!, Has completado con exito el curso: #{topic.lesson.course.title}"
		elsif TopicCompletition.where(user_id: current_user.id, topic_id: topic_ids).count == topic_ids.count
			redirect_to topic.lesson.course
			# Si no es el ultimo lesson y ha terminado todos los topics de este, lo envia al home del curso con mensaje flash e información para tomar el siguiente lesson
			flash[:notice] = "¡Has completado con exito la Lesson número #{lesson_index+1}, continua con la Lesson #{lesson_index+2}: #{Lesson.find(lesson_ids[lesson_index+1]).title}"
		else
			# Si aun no termina el lesson completo, lo redirecciona al topic siguiente
			redirect_to Topic.find(topic_ids[topic_index+1])
		end		
	end
end
