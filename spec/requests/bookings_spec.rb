require "rails_helper"

RSpec.describe "Bookings", type: :request do
  describe "GET /bookings" do
    context "when user is not logged in" do
      it "redirects to login page" do
        get bookings_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is logged in" do
      it "returns a successful response" do
        user = create(:user)
        sign_in user
        get bookings_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /hotels/:hotel_id/rooms/:room_id/bookings" do
    it "creates a new booking when logged in" do
      user = create(:user)
      hotel = create(:hotel)
      room = create(:room, hotel: hotel)
      sign_in user
      post hotel_room_bookings_path(hotel, room), params: {
        booking: {
          start_date: Date.today + 1,
          end_date: Date.today + 3
        }
      }
      expect(response).to redirect_to(bookings_path)
    end
  end
end
