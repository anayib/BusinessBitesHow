class CreateCoursesInstructors < ActiveRecord::Migration
  def change
    create_table :courses_instructors, id: false do |t|
      t.integer :course_id
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
