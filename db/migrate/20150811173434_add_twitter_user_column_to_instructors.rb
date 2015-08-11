class AddTwitterUserColumnToInstructors < ActiveRecord::Migration
  def change
  	add_column :instructors, :twitter_username, :string
  end
end
