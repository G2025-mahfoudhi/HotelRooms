class Admin::HotelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hotel, only: [ :edit, :update, :destroy ]

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to admin_hotels_path, notice: "Hôtel créé avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to admin_hotels_path, notice: "Hôtel modifié avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel.destroy
    redirect_to admin_hotels_path, notice: "Hôtel supprimé !"
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :city, :description, :price, :photo)
  end
end
