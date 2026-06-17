class HotelsController < ApplicationController
  def index
      @hotels = Hotel.all
    if params[:city].present?
      @hotels = @hotels.where("city ILIKE ?", "%#{params[:city]}%")
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms
    @review = Review.new
  end
end
