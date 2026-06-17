require "rails_helper"

RSpec.describe Room, type: :model do
  it "is valid with valid attributes" do
    room = build(:room)
    expect(room).to be_valid
  end

  it "is not valid without a room_type" do
    room = build(:room, room_type: nil)
    expect(room).not_to be_valid
  end

  it "is not valid without a price" do
    room = build(:room, price: nil)
    expect(room).not_to be_valid
  end

  it "belongs to a hotel" do
    hotel = create(:hotel)
    room = create(:room, hotel: hotel)
    expect(room.hotel).to eq(hotel)
  end
end
