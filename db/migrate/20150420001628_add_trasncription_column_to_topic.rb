class AddTrasncriptionColumnToTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :transcription, :text
  end
end
