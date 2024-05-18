class Public::HomesController < ApplicationController
  def top
    @rooms = Room.order(created_at: :desc)
  end

  def about
  end
end
