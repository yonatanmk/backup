class CreateRestaurantCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_categories do |t|
      t.belongs_to :restaurant, null: false
      t.belongs_to :category, null: false
    end
  end
end
