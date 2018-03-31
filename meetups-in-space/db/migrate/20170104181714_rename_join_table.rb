class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :user_meetups_join, :user_meetups
  end
end
