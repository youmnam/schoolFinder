json.extract! item_attachment, :id, :item_id, :image, :created_at, :updated_at
json.url item_attachment_url(item_attachment, format: :json)
