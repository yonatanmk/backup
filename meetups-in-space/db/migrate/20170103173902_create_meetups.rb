class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :user_meetups_join do |table|
      table.string :name, null: false
      table.string :description, null: false
      table.string :location, null: false
      table.string :creator_id, null: false

      table.timestamps null: false
    end
  end
end
