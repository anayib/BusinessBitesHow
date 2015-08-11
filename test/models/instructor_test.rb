# == Schema Information
#
# Table name: instructors
#
#  id                 :integer          not null, primary key
#  name               :string
#  background         :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  twitter_username   :string
#

require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
