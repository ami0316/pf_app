class Public::HotelsController < ApplicationController
  def index
    if params[:hotel_id]
      @rooms = Room.is_view.where(hotel_id: params[:hotel_id]).page(params[:page])
    elsif params[:tag_id]
      @rooms = Tag.find(params[:tag_id]).rooms.page(params[:page])
    else
      if params[:by_booking_date]
        @rooms = Room.is_view.by_booking_date.page(params[:page])
      elsif params[:by_price]
        @rooms = Room.is_view.by_price.page(params[:page])
      elsif params[:star_count]
        latest_star_ids = Comment.where(hotel_id: Hotel.ids).group(:hotel_id).order('count(star) desc').pluck(:hotel_id)
        @rooms = Room.is_view.order_as_specified(hotel_id: latest_star_ids).page(params[:page])
      else
        @rooms = Room.is_view.page(params[:page])
      end
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
