class RegistrationsController < ApplicationController
	def new
	  flash[:alert] = 'Permiso Denegado: La ruta para crear nuevos usuarios se encuentra deshabilitada'
	  redirect_to root_path
	end

	def create
	  flash[:alert] = 'Permiso Denegado: La ruta para crear nuevos usuarios se encuentra deshabilitada'
	  redirect_to root_path
	end
end
