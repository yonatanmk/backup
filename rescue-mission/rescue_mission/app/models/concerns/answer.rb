class Answer < ApplicationRecord
  validates :body, presence: true, length: { minimum: 50}
  validates :best, inclusion: [true, false]

  belongs_to :question
end
