# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  plan_id    :integer
#  stripe_id  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  has_paper_trail
end
