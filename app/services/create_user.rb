class CreateUser
	def self.call(email_address)
		user = User.find_by(email: email_address)
		
		return user if user.present?
		
		raw_token, enc_token = Devise.token_generator.generate(
			User, :reset_password_token)
		password = SecureRandom.hex(32)

		user = User.create!(
			email: email_address,
			password: password,
			password_confirmation: password,
			reset_password_token: enc_token,
			reset_password_sent_at: Time.now
		)

		return user, raw_token
	end
end

class CreatePlan
	def self.call(options={})
		plan = Plan.new(options)
		
		if !plan.valid?
			return plan
		end

		begin
			Stripe::Plan.create(
				id: options[:stripe_id],
				amount: options[:amount],
				currency: 'usd',
				interval: options[:interval],
				name: options[:name],
			)
		rescue Stripe::StripeError => e
			plan.errors[:base] << e.message
			return plan
		end

		plan.save
		
		return plan
	end
end