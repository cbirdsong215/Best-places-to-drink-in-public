class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :votes

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_eaqual_to: 1, less_than_or_eaqual_to: 5, :message => "Rating must be a whole number between 1 - 5" }
end
