# == Schema Information
#
# Table name: courses_users
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CoursesUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
