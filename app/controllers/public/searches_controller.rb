class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @word = params[:word]
    @range = params[:range]

    if @range == "hotel"
      @hotels = Hotel.looks(params[:search], params[:word])
    elsif @range == "price"
      if params[:price] == "up"
        @rooms = Room.is_view.where("price >= ?", params[:word].tr('０-９','0-9'))
      else
        @rooms = Room.is_view.where("price <= ?", params[:word].tr('０-９','0-9'))
      end
    elsif @range == "booking"
      @rooms = Room.is_view.where(booking_date: params[:word])
    else
      @rooms = Room.is_view.looks(params[:search], params[:word], params[:range])
    end
  end
end
