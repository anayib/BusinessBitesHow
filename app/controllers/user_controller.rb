class UserController < ApplicationController
	before_action :authenticate_user!
	before_filter :admin_only, :except => [:edit,:update]

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		# @user.course_ids=params[:user][:course_ids]
		if @user.update(user_params)
			# Sign in the user by passing validation in case their password changed
      # sign_in @user, :bypass => true
      if current_user.admin?
				redirect_to user_index_path
			else
				redirect_to root_path
			end
    else
    	puts @user.errors.messages
      flash[:notice] = "El usuario #{@user.email} no pudo ser editado. Posiblemente no ha ingresado su contraseña."
      redirect_to edit_user_path
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to user_index_path
	end

  def import
    User.import(params[:file])
    if params.has_key?(:file)
      redirect_to questions_path, notice: "Se han importado las preguntas."
    else
      redirect_to questions_path, alert: "Debe agregar un archivo primero."
    end
  end

	private
		def user_params
  		params.require(:user).permit(:name, :email, :role, :image, :password, :password_confirmation, { :course_ids => [] } )
		end

		def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
    end
  end
end