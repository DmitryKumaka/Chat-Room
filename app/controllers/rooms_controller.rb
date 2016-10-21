class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:edit, :update, :destroy]


  def index
    @room = Room.new
    @rooms = Room.order("created_at DESC")
  end

  def create
    @room = current_user.rooms.create(room_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @room.update(room_params)
    redirect_to root_path
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end

end
