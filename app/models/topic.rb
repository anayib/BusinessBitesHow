# == Schema Information
#
# Table name: topics
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  content_url   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  activities    :text
#  lesson_id     :integer
#  transcription :text
#

class Topic < ActiveRecord::Base
	belongs_to :lesson
	has_many :resources
	has_many :topic_completitions
	has_many :users, through: :topic_completitions
	accepts_nested_attributes_for :resources, :reject_if => :all_blank, allow_destroy: true
  validates_associated :resources
end
