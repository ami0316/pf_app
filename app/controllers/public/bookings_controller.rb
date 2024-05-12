class Public::BookingsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
  end

  def confirm
    @room = Room.find(params[:room_id])
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
    redirect_to bookings_thanks_path
  end

  def thanks
  end

  def index
  end

  def show
  end

  def edit
  end
end
