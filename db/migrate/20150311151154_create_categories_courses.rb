class CreateCategoriesCourses < ActiveRecord::Migration
  def change
    create_table :categories_courses, id: false do |t|
      t.integer :categorie_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
