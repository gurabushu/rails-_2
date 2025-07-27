class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :room_prices, dependent: :destroy
  has_one_attached :img

  validates :img, presence: true
  validates :name, presence: true
  validates :description, length: { maximum: 50 }
  validates :cash, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
