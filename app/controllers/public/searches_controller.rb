class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @word = params[:word]
    @range = params[:range]

    if @range == "宿泊施設名"
      @hotels = Hotel.looks(params[:search], params[:word])
    else
      @rooms = Room.is_view.looks(params[:search], params[:word])
    end
  end
end
