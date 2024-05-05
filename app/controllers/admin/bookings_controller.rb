class Admin::BookingsController < ApplicationController
  before_action :authenticate_admin_customer, only: [:edit, :create, :update]
  before_action :authenticate_admin!

  def new
    @room = Room.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @room = Room.new(booking_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @room.save
      redirect_to admin_booking_path(@room.id)
    else
      render :new
    end
  end

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(booking_params)
      redirect_to admin_booking_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to  new_admin_booking_path
  end

  private
  def authenticate_admin_customer
  booking = Booking.find_by(id: params[:id])
  if booking && current_admin.id != booking.admin_id
    redirect_to admin_bookings_path, notice: "他の管理者の編集はできません。"
  end
end
  # ストロングパラメータ
  def booking_params
    params.require(:room).permit(:room_name, :room_datails, :price, :image)
  end
end
