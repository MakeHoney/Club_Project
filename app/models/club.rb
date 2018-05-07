class Club < ApplicationRecord
    belongs_to :category
    has_many :photos
end
