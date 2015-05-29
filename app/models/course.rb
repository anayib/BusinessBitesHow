# == Schema Information
#
# Table name: courses
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  course_type        :integer
#

class Course < ActiveRecord::Base
	enum course_type: [:free, :with_charge]
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	has_many :enrollments
  has_many :users, through: :enrollments
  has_many :lessons, dependent: :destroy
	has_and_belongs_to_many :instructors
	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :lessons, :reject_if => :all_blank, allow_destroy: true
  validates_associated :lessons
end
