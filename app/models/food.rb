class Food < ApplicationRecord
  belongs_to :user
  has_many :reviews
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
