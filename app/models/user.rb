class User < ActiveRecord::Base
    mount_uploader :usr_logo, ImageUploader

    has_many :items
	accepts_nested_attributes_for :items
	
	has_secure_password
end
