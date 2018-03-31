class CreateUserMeetupJoinTable2 < ActiveRecord::Migration
  def change
    create_table :user_meetups_join do |table|
      table.integer :user_id, null: false
      table.integer :meetup_id, null: false
    end
  end
end
