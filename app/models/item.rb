class Item < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	belongs_to :category
	belongs_to :brand
	belongs_to :wishlist
	before_save :create_slug

	  def create_slug
	    self.slug = self.name.parameterize
	  end


scope :item_search, -> (query) { 
	 		# joins("LEFT JOIN items ON items.item_id = items.id")
	 		
	 		where("name LIKE ? OR description like ?", "%#{query}%", "%#{query}%")
	 		.group('items.id') }


end
