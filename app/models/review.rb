class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :votes

  validates :user_id, presence: true
end
