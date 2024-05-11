class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @word = params[:word]
    @range = params[:range]
    
    if @range == "Hotel"
      @hotels = Hotel.looks(params[:search], params[:word])
    else
      @rooms = Room.looks(params[:search], params[:word])
    end
  end
end
