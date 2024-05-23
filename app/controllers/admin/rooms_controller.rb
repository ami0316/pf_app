class Admin::RoomsController < ApplicationController
  def show
     @room = Room.find(params[:id])
  end

  def new
    #@hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
    #tag
    @tags = @post&.tags&.pluck(:name)&.join(',')
  end

  def create
     @room = Room.new(room_params)
     #@room.admin_id = current_admin.id
     if @room.save
       tags = params[:room][:tag].split(',')
       @room.save_tags(tags)
       flash[:notice] = "投稿が完了しました。"
       redirect_to admin_bookings_path
     else
       flash[:notice] = '項目を入力してください。'
       render :new
     end
    # @room = current_admin.rooms.new(room_params)
    # #:roomはroomで投稿されてきた際にパラメーターとして飛ばされ、その中の[:tag_id]を取得して、splitで,区切りにしている
    # tags = params[:room][:tag_id].split(',')
    # if @room.save
    # #@roomをつけることroomモデルの情報を.save_tagsに引き渡してメソッドを走らせることができる
    #   @room.save_tags(tags)
    #   redirect_to root_path, success: t('rooms.create.create_success')
    # else
    #   render :new
    # end
  end

  def edit
    @room = Room.find(params[:id])
    @tags = @room.tags.pluck(:name).join(',')
  end

  def update
    @room = Room.find(params[:id])
    #:roomはroomで投稿されてきた際にパラメーターとして飛ばされ、その中の[:tag_id]を取得して、splitで,区切りにしている
    tags = params[:room][:tag].split(',')
    if @room.update(room_params)
    #@roomをつけることroomモデルの情報を.save_tagsに引き渡してメソッドを走らせることができる
      @room.update_tags(tags)
      redirect_to root_path, success: t('rooms.edit.edit_success')
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path, success: t('rooms.destroy.destroy_success')
  end

private

  def room_params
    params.require(:room).permit(:hotel_id, :room_name, :room_details, :price, :image, :admin_id, :booking_date)
                          .merge(admin_id: current_admin.id)
  end
end