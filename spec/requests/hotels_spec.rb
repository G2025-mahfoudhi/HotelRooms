require "rails_helper"

RSpec.describe "Hotels", type: :request do
  describe "GET /hotels" do
    it "returns a successful response" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /hotels/:id" do
    it "returns a successful response" do
      hotel = create(:hotel)
      get hotel_path(hotel)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /hotels with search" do
    it "filters hotels by city" do
      hotel = create(:hotel, city: "Paris")
      get root_path, params: { city: "Paris" }
      expect(response.body).to include("Paris")
    end
  end
end
