class Admin::FacilitysController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show; end

  def edit
    @room = Room.find(params[:id])
  end

  private
    def room_params
      params.require(:room).permit(:room_name, :room_details, :price, :image, :hotel_id, :admin_id, :booking_date)
    end
end
