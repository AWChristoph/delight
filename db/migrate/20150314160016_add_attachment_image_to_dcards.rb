class AddAttachmentImageToDcards < ActiveRecord::Migration
  def self.up
    change_table :dcards do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dcards, :image
  end
end
