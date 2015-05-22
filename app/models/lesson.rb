# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class Lesson < ActiveRecord::Base
	belongs_to :course	
	has_many :topics, dependent: :destroy
	accepts_nested_attributes_for :topics, :reject_if => :all_blank, allow_destroy: true
  validates_associated :topics
end
