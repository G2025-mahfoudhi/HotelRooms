class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :room_type, presence: true
  validates :price, presence: true
end
