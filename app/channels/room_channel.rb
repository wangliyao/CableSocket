class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    ActionCable.server.broadcast 'room_channel', message: params[:session][:username]
  end

  def unsubscribed
  	ActionCable.server.broadcast 'room_channel', message: "#{current_user} 退出"
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    Message.create! content: data['message']
  end
end
