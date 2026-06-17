class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, through: :rooms
  has_one_attached :photo

  validates :name, presence: true
  validates :city, presence: true
  validates :price, presence: true
end
