class CategoryClub < ApplicationRecord
  belongs_to :club
  belongs_to :category
end