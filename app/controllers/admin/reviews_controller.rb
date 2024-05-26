class Admin::ReviewsController < ApplicationController
  def index
    @rooms = current_admin.rooms
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_reviews_path, notice: "コメントが削除されました"
  end
end
