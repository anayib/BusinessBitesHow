# == Schema Information
#
# Table name: categories_courses
#
#  category_id :integer
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoriesCourse < ActiveRecord::Base
	belongs_to :category
	belongs_to :course
end
