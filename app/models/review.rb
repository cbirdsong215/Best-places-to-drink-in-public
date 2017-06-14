class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :votes

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :status, presence: true
end
