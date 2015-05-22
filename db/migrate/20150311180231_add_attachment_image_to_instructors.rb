class AddAttachmentImageToInstructors < ActiveRecord::Migration
  def self.up
    change_table :instructors do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :instructors, :image
  end
end
