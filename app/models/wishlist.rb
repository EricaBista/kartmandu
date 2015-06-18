class Wishlist < ActiveRecord::Base
  has_many :item
  belongs_to :user
end
