class RevertToCreatorId < ActiveRecord::Migration
  def change
    rename_column :meetups, :user_id, :creator_id
  end
end
