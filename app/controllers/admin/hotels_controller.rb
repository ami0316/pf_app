class Admin::HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
     @hotel = Hotel.new
  end

  def create
    hotel = Hotel.new(hotel_params)
    hotel.save
    redirect_to admin_hotel_path(hotel.id)
  end



 private

  def hotel_params
  params.require(:hotel).permit(:hotel_name, :body, :url, :telephone_number)
  end
end