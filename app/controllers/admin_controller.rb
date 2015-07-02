class AdminController < ApplicationController
	before_action :authenticate_user!
	before_filter :admin_only
	
	private
		def admin_only
	    unless current_user.admin?
	      redirect_to root_path, :alert => "Acceso denegado, no posee permisos como administrador"
	    end
	  end
end
