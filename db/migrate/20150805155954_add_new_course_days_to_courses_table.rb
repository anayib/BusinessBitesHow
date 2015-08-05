class AddNewCourseDaysToCoursesTable < ActiveRecord::Migration
  def change
  	add_column :courses, :new_course_days, :integer
  end
end
