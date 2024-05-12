class Public::HotelsController < ApplicationController
  def index
    @rooms = Room.all
    #@booking_date = params[:booking_date]
  end

  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
    @hotel = Hotel.find(params[:id])
    @comments = @hotel.comments
  end

end
