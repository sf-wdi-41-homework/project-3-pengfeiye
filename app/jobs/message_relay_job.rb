class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatboxes:#{message.chatbox.id}", {
      message: MessagesController.render(partial: message),
      chatbox_id: message.chatbox.id,
      current_user: message.user.id
    }
  end
end
