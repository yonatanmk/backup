class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :user_meetups
  has_many :attendees, through: :user_meetups, class_name: :User

  validates :name, length: { minimum: 1 }, presence: true
  validates :description, length: { in: 1..100 }, presence: true
  validates :location, length: { minimum: 1 }, presence: true
  validates :creator_id, presence: true
end
