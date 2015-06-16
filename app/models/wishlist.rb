class Wishlist < ActiveRecord::Base
  belongs_to :item_id
  belongs_to :user_id
end
