class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :status, inclusion: { in: -1..1 }
  validates :user_id, uniqueness: { scope: :review_id }
end
