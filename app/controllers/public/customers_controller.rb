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
  end

  def mypage
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to  new_customer_registration_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end
end