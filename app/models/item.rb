class Item < ActiveRecord::Base
	belongs_to :user
	has_many :item_attachments
	has_many :item_specs
    accepts_nested_attributes_for :item_attachments
	accepts_nested_attributes_for :item_specs

def self.search(search)
  where("item_name LIKE ?", "%#{search}%") 
end

def self.findwithuser(userid)
  where("user_id = ?", "#{userid}") 
end

def self.findbyCat(catid)
  where("category_id = ?", "#{catid}") 
end

def self.findwithcategory(category_id)
  where("category_id = ?", "#{category_id}") 
end

end
