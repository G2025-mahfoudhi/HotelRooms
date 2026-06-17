class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :room_type, presence: true
  validates :price, presence: true
end
