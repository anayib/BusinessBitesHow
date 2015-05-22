class ChangeCoursesUsersToEnrollments < ActiveRecord::Migration
  def change
  	rename_table :courses_users, :enrollments
  end
end
