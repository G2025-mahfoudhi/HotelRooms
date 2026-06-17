class Admin::RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hotel
  before_action :set_room, only: [ :edit, :update, :destroy ]

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.hotel = @hotel
    if @room.save
      redirect_to admin_hotel_rooms_path(@hotel), notice: "Chambre créée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to admin_hotel_rooms_path(@hotel), notice: "Chambre modifiée avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to admin_hotel_rooms_path(@hotel), notice: "Chambre supprimée !"
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:room_type, :price, photos: [])
  end
end
