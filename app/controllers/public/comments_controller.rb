class Public::CommentsController < ApplicationController
  before_action :find_hotel, only: [:create, :destroy]
  
  def index; end

  def edit; end

  def create
    # @hotel = Hotel.find(params[:hotel_id])
    # @comments = @hotel.comments.order(created_at: :desc)
    @comment = current_customer.comments.new(comment_params)
    @comment.hotel_id = @hotel.id # ホテルIDを指定する必要がある場合
    @comment.save
    # redirect_to request.referer
  end

  def destroy
    # @hotel = Hotel.find(params[:hotel_id])
    # @comments = @hotel.comments.order(created_at: :desc)
    @comment = Comment.find(params[:id])
    @comment.destroy
    # redirect_to request.referer
  end


  private

  def comment_params
    params.require(:comment).permit(:comment, :star)
  end

  def find_hotel
    @hotel = Hotel.find(params[:hotel_id])
    @comments = @hotel.comments.order(created_at: :desc)
  end
end
