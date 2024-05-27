class Public::HotelsController < ApplicationController
  def index
    if params[:hotel_id]
      @rooms = Room.is_view.where(hotel_id: params[:hotel_id]).page(params[:page])
    elsif params[:tag_id]
      @rooms = Tag.find(params[:tag_id]).rooms.page(params[:page])
    else
      @rooms = Room.is_view.page(params[:page])
    end
     @tags = Tag.all
  end

  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
    @hotel = Hotel.find(@room.hotel.id)
    @comments = @hotel.comments.order(created_at: :desc)
  end

end
