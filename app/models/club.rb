class Club < ApplicationRecord
    belongs_to :category, required: false
    has_many :photos
    has_one :user
    has_and_belongs_to_many :hashtags
    mount_uploader :image, ImageUploader
    resourcify
    
    # has_many :comments
    # has_and_belongs_to_many :hashtags
    # accepts_nested_attributes_for :hashtags
        
    

end


