class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_plans

	def new
		@subscription = Subscription.new
		@plan = Plan.find(1)
	end

	def create
		@plan = Plan.find(1)
		@subscription = CreateSubscription.call(
			@plan,
			current_user.email,
			params[:stripeToken]
		)
		if @subscription.errors.blank?
			flash[:notice] = 'Gracias por tu subscripcion, desde este momento haces parte de la comunidad VIP de BusinessBites.'
			current_user.role = "vip_user"
			current_user.save
			redirect_to '/'
		else
			render :new
		end
	end

	protected
		def load_plans
		@plans = Plan.where(published: true).order('amount')
		end
end