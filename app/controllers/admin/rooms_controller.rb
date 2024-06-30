class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
    @tags = @post&.tags&.pluck(:name)&.join(",")
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      tags = params[:room][:tag].split(",").uniq
      @room.save_hotel_tags(tags)
      flash[:notice] = "投稿が完了しました。"
      redirect_to admin_bookings_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    @tags = @room.tags.pluck(:name).join(",")
  end

  def update
    @room = Room.find(params[:id])
    # :roomはroomで投稿されてきた際にパラメーターとして飛ばされ、その中の[:tag_id]を取得して、splitで,区切りにしている
    tags = params[:room][:tag].split(",").uniq
    if @room.save_hotel_tags(tags)
      # @roomをつけることroomモデルの情報を.save_tagsに引き渡してメソッドを走らせることができる
      @room.update_tags(tags)
      redirect_to root_path, success: t("rooms.edit.edit_success")
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path, success: t("rooms.destroy.destroy_success")
  end

private
  def room_params
    params.require(:room).permit(:hotel_id, :room_name, :room_details, :price, :image, :admin_id, :booking_date)
                          .merge(admin_id: current_admin.id)
  end
end
