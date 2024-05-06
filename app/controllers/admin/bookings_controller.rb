class Admin::BookingsController < ApplicationController
  before_action :authenticate_admin_customer, only: [:edit, :update]
  before_action :authenticate_admin!

  def new
    @room = Room.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @room = Room.new(room_params)
    @room.admin_id = current_admin.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @room.save!
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

    if @room.update(room_params)
      redirect_to admin_booking_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to  new_admin_booking_path
  end

  private

  def authenticate_admin_customer
    room = Room.find_by(id: params[:id])
    if room.try(:admin_id).blank?
      redirect_to admin_bookings_path, notice: "該当の投稿が存在しません"
    end
    if room.try(:admin_id) && current_admin.id != room.try(:admin_id)
      redirect_to admin_bookings_path, notice: "他の管理者の編集はできません。"
    end
  end

  # ストロングパラメータ
  def room_params
    params.require(:room).permit(:room_name, :room_details, :price, :image, :hotel_id, :admin_id)
  end
end