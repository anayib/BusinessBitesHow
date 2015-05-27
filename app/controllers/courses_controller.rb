class CoursesController < ApplicationController
	before_action :authenticate_user!
	before_filter :content_permission, :except => [:show,:my_courses]

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
  		flash[:alert] = "Ha ocurrido un error y el curso #{@course.title}, no ha sido almacenado"
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
			flash[:alert] = 'Se ha encontrado un error al intentar editar este curso'
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
  		params.require(:course).permit(:title, :description, :image, :course_type, { :instructor_ids => [] }, { :category_ids => [] }, lessons_attributes: [:id,:title,:description,:_destroy, topics_attributes: [:id,:title,:description,:content_url, :activities, :document, :transcription, :_destroy, resources_attributes: [ :id, :title, :description, :link_url, :_destroy]]])
		end
		
		def content_permission
	    unless current_user.admin? || current_user.content_manager?
	      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
	    end
  	end
end