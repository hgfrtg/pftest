class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    Chat.create(user_id: data['user_id'], room_id: params['room_id'], message: data['data'])
    user = User.find(data['user_id'])
    ActionCable.server.broadcast "chat_channel_#{params['room_id']}", user_id: user.id, user_name: user.name, message: data['data']
  end
end