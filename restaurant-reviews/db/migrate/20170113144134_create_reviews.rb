class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false
      t.timestamps
      t.belongs_to :restaurant, null: false
    end
  end
end
