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
end
