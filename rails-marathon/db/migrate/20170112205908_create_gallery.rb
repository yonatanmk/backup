class CreateGallery < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :description
    end
  end
end
