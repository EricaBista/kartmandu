json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :icon, :description
  json.url brand_url(brand, format: :json)
end
