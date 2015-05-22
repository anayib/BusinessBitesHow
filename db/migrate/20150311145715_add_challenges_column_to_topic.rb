class AddChallengesColumnToTopic < ActiveRecord::Migration
  def change
  	add_column :topics, :challenges_markdown, :text
  end
end
