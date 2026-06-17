class RoomsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:id])
    @booking = Booking.new
  end
end
