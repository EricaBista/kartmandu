class Category < ActiveRecord::Base
	has_many :items
	before_save :create_slug

	  def create_slug
	    self.slug = self.name.parameterize
	  end

	
end
