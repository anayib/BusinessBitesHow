class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_filter :content_permission

	def index
		@categories = Category.all
	end

	def new	
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
  	  flash[:notice] = "La categoria #{@category.name} fue creada con exito"
  	  redirect_to categories_path
  	else
  		flash[:alert] = "Ha ocurrido un error y la categoria #{@category.name}, no ha sido almacenado"
    	render :action => 'new'
  	end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			redirect_to categories_path
		else
			flash[:alert] = 'Se ha encontrado un error al intentar editar esta categoría'
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end
	private
		def category_params
  		params.require(:category).permit(:name)
		end
		
		def content_permission
	    unless current_user.admin? || current_user.content_manager?
	      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
	    end
  	end
end
