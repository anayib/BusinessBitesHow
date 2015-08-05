class CoursesController < ApplicationController
	before_action :authenticate_user!
	before_filter :content_permission, :only => [:show]
	before_filter :has_permission?, :only => [:new,:create,:edit,:update]

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
		lessons = @course.lessons.build
 		topics = lessons.topics.build
 		resources = topics.resources.build
	end

	def create
		@course = Course.new(course_params)
		@course.instructor_ids = params[:course][:instructor_ids]
		@course.category_ids = params[:course][:category_ids]
		if @course.save
  	  flash[:notice] = "El course #{@course.title} fue creado con exito"
  	  redirect_to courses_path
  	else
  		flash[:alert] = "Ha ocurrido un error y la guía #{@course.title}, no ha sido almacenada"
    	render :action => 'new'
  	end
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
			redirect_to courses_path
		else
			flash[:alert] = 'Se ha encontrado un error al intentar editar esta guía'
			render 'edit'
		end
	end

	def show
		@topics_ready_ids = current_user.topics.pluck(:id)
		@course = Course.find(params[:id])
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to courses_path
	end

	def my_courses
		@courses = current_user.courses
	end

	private
		def course_params
  		params.require(:course).permit(:title, :description, :new_course, :new_course_days, :image, :course_type, { :instructor_ids => [] }, { :category_ids => [] }, lessons_attributes: [:id,:title,:description,:_destroy, topics_attributes: [:id,:title,:description,:content_url, :activities, :document, :transcription, :_destroy, resources_attributes: [ :id, :title, :description, :link_url, :_destroy]]])
		end

		def content_permission
	    if Course.find(params[:id]).with_charge?
	    	unless current_user.vip_user? || current_user.admin? || current_user.content_manager? || current_user.guest?
	    		redirect_to root_path, :alert => "Lo sentimos, usted no posee una cuenta VIP, por lo tanto no puede acceder a la información de la guía: #{Course.find(params[:id]).title}."
	    	end
	    end
  	end

  	def has_permission?
  		unless current_user.admin? || current_user.content_manager?
  			redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos para acceder a esta ruta"
  		end
  	end
end