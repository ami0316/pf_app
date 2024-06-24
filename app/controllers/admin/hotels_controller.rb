class Admin::HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
     @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = '施設名を登録しました。'
      redirect_to admin_hotel_path(@hotel.id)
    else
      flash[:notice] = '項目を入力してください。'
      render :new
    end
  end

  def index
    @hotels = Hotel.all
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    hotel = Hotel.find(params[:id])
    hotel.update(hotel_params)
    redirect_to admin_hotel_path(hotel.id)
  end

 private

  def hotel_params
  params.require(:hotel).permit(:hotel_name, :body, :url, :telephone_number, :address).merge(admin_id: current_admin.id)
  end
end