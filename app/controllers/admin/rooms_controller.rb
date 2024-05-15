class Admin::RoomsController < ApplicationController
  def show
     @room = Room.find(params[:id])
  end

  def new
    #@hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
    #tag
  end

  def create
     @room = Room.new(room_params)
     #@room.admin_id = current_admin.id
     if @room.save!
      redirect_to admin_room_path(@room)
     else
       render :new
     end
  end

private

  def room_params
    params.require(:room).permit(:hotel_id, :room_name, :room_details, :price, :image, :admin_id, :booking_date)
  end
end