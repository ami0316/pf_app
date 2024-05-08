class Public::HotelsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
  end
end
