class InstructorsController < ApplicationController
	before_action :authenticate_user!
	before_filter :content_permission

	def index
		@instructors = Instructor.all
	end

	def new	
		@instructor = Instructor.new
	end

	def create
		@instructor = Instructor.new(instructor_params)
		if @instructor.save
  	  flash[:notice] = "El instructor #{@instructor.name} fue creado con exito"
  	  redirect_to instructors_path
  	else
  		flash[:alert] = "Ha ocurrido un error y el instructor #{@instructor.name}, no ha sido almacenado"
    	render :action => 'new'
  	end
	end

	def edit
		@instructor = Instructor.find(params[:id])
	end

	def update
		@instructor = Instructor.find(params[:id])
		if @instructor.update(instructor_params)
			redirect_to instructors_path
		else
			flash[:alert] = 'Se ha encontrado un error al intentar editar este instructor'
			render 'edit'
		end
	end

	def destroy
		@instructor = Instructor.find(params[:id])
		@instructor.destroy
		redirect_to instructors_path
	end

	private
		def instructor_params
  		params.require(:instructor).permit(:name, :background, :image)
		end
		
		def content_permission
	    unless current_user.admin? || current_user.content_manager?
	      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
	    end
  	end
end
