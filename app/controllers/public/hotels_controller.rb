class Public::HotelsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
    @hotel = Hotel.find(params[:id])
    @comments = @hotel.comments
  end

end
