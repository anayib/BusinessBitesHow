class ChangeCategorieToCategory < ActiveRecord::Migration
  def change
  	rename_column :categories_courses, :categorie_id, :category_id
  end
end
