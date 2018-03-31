class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.string :due_date

      t.belongs_to :user
      t.belongs_to :project, null: false
    end
  end
end
