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

class Resource < ActiveRecord::Base
	belongs_to :topic
end
