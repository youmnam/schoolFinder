class ItemSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :item_name, :item_desc, :item_price, :item_minp , :item_maxp, :category_id,:item_available, :item_per, :item_attachments, :item_specs
end