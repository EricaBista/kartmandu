json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :id, :item_id, :name
  json.url wishlist_url(wishlist, format: :json)
end
