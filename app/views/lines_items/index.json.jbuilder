json.array!(@lines_items) do |lines_item|
  json.extract! lines_item, :id, :item_id, :cart_id, :unit_price, :quantity
  json.url lines_item_url(lines_item, format: :json)
end
