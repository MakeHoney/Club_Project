class Club < ApplicationRecord
    belongs_to :category
    has_many :photos
    has_one :user
    resourcify
end
