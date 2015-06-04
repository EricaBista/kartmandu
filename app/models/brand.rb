class Brand < ActiveRecord::Base
	has_many :items
	mount_uploader :icon, IconUploader
	before_save :create_slug

	  def create_slug
	    self.slug = self.name.parameterize
	  end
end
