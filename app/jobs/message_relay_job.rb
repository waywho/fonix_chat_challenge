class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "messages_channel",
      message: ::MessagesController.render(message),
      chatroom_id: message.chatroom.id
  end
end
