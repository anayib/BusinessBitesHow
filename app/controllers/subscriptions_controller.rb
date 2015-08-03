class SubscriptionsController < ApplicationController
	before_action	 :authenticate_user!
	before_filter :load_plans
	before_filter :has_subscription?, :except => [:edit,:update]

	def new
		@subscription = Subscription.new
	end

	def create
		@plan = Plan.find(params[:plan_id])
		@subscription = CreateSubscription.call(
			@plan,
			current_user.email,
			params[:stripeToken]
		)
		if @subscription.errors.blank?
			flash[:notice] = 'Gracias por tu subscripcion, desde este momento haces parte de la comunidad VIP de BusinessBites.'
			current_user.role = "vip_user"
			current_user.save
			User.welcome_subscriptor_email(current_user)
			redirect_to welcome_new_subscriptor_path
		else
			render :new
		end
	end

	def edit
		@subscription = current_user.subscription
		@plan = current_user.subscription.plan
	end

	def update
		@subscription = current_user.subscription
		@plan = current_user.subscription.plan
		@subscription = ChangeSubscriptionCard.call(
			@subscription,
			params[:stripeToken]
		)
		if @subscription.errors.blank?
			flash[:notice] = 'Su tarjeta de crédito ha sido actualizada, muchas gracias por usar nuestros servicios'
			@subscription.save
			redirect_to '/'
		else
			render :edit
		end
	end

	protected
		def load_plans
			@plans = Plan.where(published: true).order('amount')
		end

		def has_subscription?
			if !current_user.subscription.nil?
				redirect_to root_path, :alert => "Usted ya se encuentra suscrito a una cuenta VIP en BusinessBites."
			elsif current_user.content_manager?
				redirect_to root_path, :alert => "Usted es gestor de contenido, por lo tanto no necesita una cuenta VIP en BusinessBites."
			elsif current_user.admin?
				redirect_to root_path, :alert => "Usted es administrador de este sitio WEB, por lo tanto no necesita una cuenta VIP en BusinessBites."
			elsif current_user.guest?
				redirect_to root_path, :alert => "Usted posee una cuenta como invitado en este sitio WEB, por lo tanto no necesita una cuenta VIP en BusinessBites."
			end
		end
end