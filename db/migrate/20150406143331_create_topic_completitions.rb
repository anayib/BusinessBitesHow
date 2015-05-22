class CreateTopicCompletitions < ActiveRecord::Migration
  def change
    create_table :topic_completitions do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
