class Public::BookingsController < ApplicationController
  before_action :get_room, only: [:new, :confirm]

  def confirm
    @number_of_people = params[:number_of_people]
    time_map = {'15:00': 1, '16:00': 2,'17:00': 3, '18:00': 4,'19:00': 5, '20:00': 6,'21:00': 7, '22:00': 8,'23:00': 8, '0:00': 9}
    @time = time_map.key(params[:time].to_i)
  end

  def create
    @booking = Booking.create!(booking_date: params[:booking_date],
                              time: params[:time],
                              number_of_people: params[:number_of_people],
                              #price: params[:price],
                              customer_id: current_customer.id,
                              room_id: params[:room_id])
    WelcomeMailer.send_when_signup(current_customer.email, current_customer.last_name, @booking).deliver
    Room.find(params[:room_id]).destroy
    redirect_to bookings_thanks_path
  end

  def show
    @booking = Booking.find(params[:id])
    @comment = Comment.new
    # コメント用のコード
    @booking_comments = @booking.comments

    # タグ用のコード
    @tags = @booking.tags.pluck(:name).join(',')

    # 閲覧数表示
    impressionist(@booking, nil, :unique => ["session_hash"])
  end

  def edit; end

  def update; end

  def thanks; end

  def index; end

  def new; end

  private

  def get_room
    @room = Room.find(params[:room_id])
  end
end
