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

require 'test_helper'

class TopicCompletitionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
