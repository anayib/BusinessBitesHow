# == Schema Information
#
# Table name: courses_instructors
#
#  course_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CoursesInstructor < ActiveRecord::Base
	belongs_to :user
	belongs_to :instructor
end
