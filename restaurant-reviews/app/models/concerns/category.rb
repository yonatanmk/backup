class Category < ApplicationRecord
  validates :name, presence: true

  has_many :restaurant_categories
  has_many :restaurants, through: :restaurant_categories
end
