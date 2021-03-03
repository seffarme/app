class Review < ApplicationRecord
  belongs_to :restaurant
  RATE = [0,1,2,3,4,5]
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: RATE }
  validates :rating, numericality: { only_integer: true }
end
