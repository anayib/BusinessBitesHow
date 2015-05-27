class AddColumnCourseTypeToCoursesTable < ActiveRecord::Migration
  def change
  	add_column :courses, :course_type, :integer
  end
end
