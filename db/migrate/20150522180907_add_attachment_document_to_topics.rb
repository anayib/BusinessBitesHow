class AddAttachmentDocumentToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :topics, :document
  end
end
