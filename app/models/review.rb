class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :votes

  validates :user_id, presence: true
  validates :body, presence: true
  validates :rating, presence: true
end
