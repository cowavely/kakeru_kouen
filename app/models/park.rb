class Park < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	acts_as_taggable_on :tags
end
