class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_plans
	
	def index
	end

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
			flash[:notice] = 'Thank you for your purchase!' +
			'Please click the link in the email we just sent ' +
			'you to get started.'
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