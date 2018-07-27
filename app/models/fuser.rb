class Fuser < ApplicationRecord
	 mount_uploader :image, ImageUploader
validates :name, presence: true,
                    length: { minimum: 5 }
end
