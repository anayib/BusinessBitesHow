# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  link_url    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  topic_id    :integer
#

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
