class Brand < ActiveRecord::Base
	has_many :items
	mount_uploader :icon, IconUploader
end
