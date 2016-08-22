class AddAttachmentImageToDwellings < ActiveRecord::Migration
  def self.up
    change_table :dwellings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dwellings, :image
  end
end
