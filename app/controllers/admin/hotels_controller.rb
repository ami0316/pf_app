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
      redirect_to admin_hotel_path(hotel.id)
    else
      flash[:notice] = '項目を入力してください。'
      render :new
    end
  end



 private

  def hotel_params
  params.require(:hotel).permit(:hotel_name, :body, :url, :telephone_number)
  end
end