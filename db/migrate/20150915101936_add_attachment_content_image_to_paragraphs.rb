class AddAttachmentContentImageToParagraphs < ActiveRecord::Migration
  def self.up
    change_table :paragraphs do |t|
      t.attachment :content_image
    end
  end

  def self.down
    remove_attachment :paragraphs, :content_image
  end
end
