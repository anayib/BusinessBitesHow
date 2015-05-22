class AddLessonIdFieldToTopicModel < ActiveRecord::Migration
  def change
  	add_column :topics, :lesson_id, :integer
  end
end
