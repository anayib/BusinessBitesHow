# == Schema Information
#
# Table name: plans
#
#  id          :integer          not null, primary key
#  stripe_id   :string
#  name        :string
#  description :text
#  amount      :integer
#  interval    :string
#  published   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Plan < ActiveRecord::Base
end
