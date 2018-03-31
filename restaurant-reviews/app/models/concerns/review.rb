class Review < ApplicationRecord
  validates :rating, presence: true, inclusion: 1..5
  validates :body, presence: true
  belongs_to :restaurant
  validates :restaurant_id, presence: true
end
