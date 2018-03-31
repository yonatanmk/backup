class UserMeetup < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :attendee, class_name: :User, foreign_key: :user_id
  belongs_to :meetup
end
