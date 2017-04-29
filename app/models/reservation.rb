class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :renter

    def self.findbyItem(itemid)
  	where("item_id = ?", "#{itemid}") 
  end
end
