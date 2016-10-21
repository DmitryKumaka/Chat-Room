class MessagesController < ApplicationController
  before_action :authenticate_user!


  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages.all
    @message = Message.new
  end

  def create
    @room = Room.find(params[:room_id])
    message = @room.messages.new(message_params)
    message.user_id = current_user.id
    message.save
    redirect_to room_messages_path(@room)
  end

  def edit
    @room = Room.find(params[:room_id])
    @message = @room.messages.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    message = @room.messages.find(params[:id])
    message.update(message_params)
    redirect_to room_messages_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    message = @room.messages.find(params[:id])
    message.destroy
    redirect_to room_messages_path(@room)
  end






  private

  def message_params
    params.require(:message).permit(:text)
  end
end
