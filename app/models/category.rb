class Category < ActiveRecord::Base
	mount_uploader :banner_image, CateUploader
	has_many :items
	belongs_to :brand
	before_save :create_slug

  def create_slug
    self.slug = self.name.parameterize
  end	
end
