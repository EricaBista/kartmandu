class Cart < ActiveRecord::Base
  has_many :orders
  has_many :lines_items

  def paypal_url(return_url, notify_url)
    values = {
      :business => 'erica@nepaldigital.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    lines_items.each_with_index do |i, index|
      item = Item.find_by_id(i.item_id)
      values.merge!({
        "amount_#{index+1}" => item.price,
        "item_name_#{index+1}" => item.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => i.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end