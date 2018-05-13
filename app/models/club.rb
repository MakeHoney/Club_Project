class Club < ApplicationRecord
    belongs_to :category
    has_many :photos
    has_one :user
    resourcify
    #임시지정
    validates_presence_of :category
    searchable do
        text :category
    end
end
