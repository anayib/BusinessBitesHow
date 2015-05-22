module ApplicationHelper
	def link_to_add_lessons(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |lesson|
			render(association.to_s.singularize + "_form", lesson: lesson)
		end
		link_to(name, '#', class: "Add_field btn btn-ar btn-lg btn-warning", data: {id: id, fields: fields.gsub("\n","")})
	end

	def link_to_add_topics(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |topic|
			render(association.to_s.singularize + "_form", topic: topic)
		end
		link_to(name, '#', class: "Add_field btn btn-ar btn-lg btn-warning", data: {id: id, fields: fields.gsub("\n","")})
	end

	def link_to_add_resources(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |resource|
			render(association.to_s.singularize + "_form", resource: resource)
		end
		link_to(name, '#', class: "Add_field btn btn-ar btn-lg btn-warning", data: {id: id, fields: fields.gsub("\n","")})
	end

	def link_to_add_instructors(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |instructor|
			render(association.to_s.singularize + "_form", instructor: instructor)
		end
		link_to(name, '#', class: "Add_field btn btn-ar btn-lg btn-warning", data: {id: id, fields: fields.gsub("\n","")})
	end
end
