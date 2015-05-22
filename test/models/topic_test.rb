# == Schema Information
#
# Table name: topics
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  content_url           :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  activities            :text
#  lesson_id             :integer
#  transcription         :text
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
