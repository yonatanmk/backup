class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, numericality: true, allow_nil: true
  validates :project_id, presence: true, numericality: true

  belongs_to :user
  belongs_to :project
end
