json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :price, :order, :image
  json.url item_url(item, format: :json)
end
