class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = current_user.bookings
  end
  def new
    @room = Room.find(params[:room_id])
    @hotel = Hotel.find(params[:hotel_id])
    @booking = Booking.new
  end

  def create
    @room = Room.find(params[:room_id])
    @hotel = Hotel.find(params[:hotel_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = @room
    days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = days * @room.price
    if @booking.save
      redirect_to bookings_path, notice: "Réservation confirmée !"
    else
      render :new, status: :unprocessable_entity
    end
  end

   private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
