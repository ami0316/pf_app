class Public::HotelsController < ApplicationController
  def index
    if params[:hotel_id]
      @rooms = Room.where(hotel_id: params[:hotel_id])
    else
      @rooms = Room.all
    end
  end

  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
    @hotel = Hotel.find(params[:id])
    @comments = @hotel.comments.order(created_at: :desc)
  end

end
