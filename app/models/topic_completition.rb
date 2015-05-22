# == Schema Information
#
# Table name: topic_completitions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#

class TopicCompletition < ActiveRecord::Base
	belongs_to :user
  belongs_to :topic
end
