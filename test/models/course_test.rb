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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
