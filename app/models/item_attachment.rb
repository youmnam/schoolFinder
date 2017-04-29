class ItemAttachment < ActiveRecord::Base
		mount_uploader :image, ImageUploader
		belongs_to :item


def self.findbyItemId(id)
  where("item_id = ?", "#{id}") 
end
end
