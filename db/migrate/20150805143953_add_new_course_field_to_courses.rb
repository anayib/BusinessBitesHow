class AddNewCourseFieldToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :new_course, :boolean
  end
end
