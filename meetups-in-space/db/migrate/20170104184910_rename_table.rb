class RenameTable < ActiveRecord::Migration
  def change
    rename_table :user_meetups_join, :meetups
  end
end
