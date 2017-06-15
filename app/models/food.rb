class Food < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
