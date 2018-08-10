class Friendship < ApplicationRecord
	mount_uploader :image, ImageUploader 
	belongs_to :user
	belongs_to :friend, class_name: "User"
	
end

