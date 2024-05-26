class Public::HomesController < ApplicationController
  def top
    @rooms = Room.order(created_at: :desc)
  end

  def about
  end

  def done
    ContactMailer.send_mail(params).deliver
  end


end
