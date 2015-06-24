json.array!(@contacts) do |contact|
  json.extract! contact, :id, :slug, :title, :description, :order, :home_page
  json.url contact_url(contact, format: :json)
end
