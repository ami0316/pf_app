class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit; end

  def unsubscribe; end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "ユーザーを退会処理しました。"
    redirect_to admin_customers_path
  end
end
