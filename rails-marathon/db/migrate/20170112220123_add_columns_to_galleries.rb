class AddColumnsToGalleries < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :location
    add_column :galleries, :city, :string, null: false
    add_column :galleries, :state, :string, null: false
    add_column :galleries, :zip, :string, null: false
  end
end
