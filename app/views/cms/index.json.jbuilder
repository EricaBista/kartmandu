json.array!(@cms) do |cm|
  json.extract! cm, :id, :terms_of_use, :contact_us, :cash_on_delivery, :free_shipping, :privacy, :policy, :blog, :need_, :help
  json.url cm_url(cm, format: :json)
end
