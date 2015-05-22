class ChangeNameToColumnChallengesMarkdown < ActiveRecord::Migration
  def change
  	rename_column :topics, :challenges_markdown, :activities
  end
end
