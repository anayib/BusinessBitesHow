class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.string :link_url

      t.timestamps null: false
    end
  end
end
