class Club < ApplicationRecord
    belongs_to :category
    has_many :photos
    has_one :user
    resourcify
    has_many :comments
    has_and_belongs_to_many :hashtags
    accepts_nested_attributes_for :hashtags
    #임시지정
    validates_presence_of :clubs
    searchable do
        text :clubs
    end
end
