require "rails_helper"

RSpec.describe Hotel, type: :model do
  it "is valid with valid attributes" do
    hotel = build(:hotel)
    expect(hotel).to be_valid
  end

  it "is not valid without a name" do
    hotel = build(:hotel, name: nil)
    expect(hotel).not_to be_valid
  end

  it "is not valid without a city" do
    hotel = build(:hotel, city: nil)
    expect(hotel).not_to be_valid
  end

  it "is not valid without a price" do
    hotel = build(:hotel, price: nil)
    expect(hotel).not_to be_valid
  end

  it "has many rooms" do
    hotel = create(:hotel)
    room = create(:room, hotel: hotel)
    expect(hotel.rooms).to include(room)
  end
end
