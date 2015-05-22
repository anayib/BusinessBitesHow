class AddCourseIdToTopicCompletition < ActiveRecord::Migration
  def change
  	add_column :topic_completitions, :course_id, :integer
  end
end
