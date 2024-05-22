class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def edit
    @customer = Customer.find(params[:id])
    # ログインユーザー以外が編集画面のURLを入力した場合
    if current_customer != @customer
       redirect_to customers_mypage_path, notice: "他のユーザーの編集はできません。"
    end
  end

  def show
     @customer = current_customer
  end

  def mypage
     @customer = current_customer
     @bookings = Booking.where(customer_id: @customer.id)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to  customer_path(@customer.id)
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to  new_customer_registration_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana)
  end
end