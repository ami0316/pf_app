class Public::CommentsController < ApplicationController
  def index
  end

  def edit
  end

  def create
    hotel = Hotel.find(params[:hotel_id])
    comment = current_customer.comments.new(comment_params)
    comment.hotel_id = hotel.id # ホテルIDを指定する必要がある場合
    comment.save
    redirect_to hotels_path
  end

  def destroy
    Comment.find(params[:id])
    comment.destroy
    redirect_to hotels_path
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end