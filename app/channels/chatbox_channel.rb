class ChatboxChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatboxes.each do |chatbox|
      stream_from "chatboxes:#{chatbox.id}"
    end
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def send_message(data)
    stream_from "chatboxes:#{data['chatbox_id']}"
    @chatbox = Chatbox.find(data['chatbox_id'])
    message = @chatbox.messages.create(content: data['content'], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
