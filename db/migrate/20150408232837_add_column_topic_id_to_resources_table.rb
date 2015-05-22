class AddColumnTopicIdToResourcesTable < ActiveRecord::Migration
  def change
  	add_column :resources, :topic_id, :integer
  end
end
