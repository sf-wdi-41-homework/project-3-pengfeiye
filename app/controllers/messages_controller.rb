class MessagesController < ApplicationController
  before_action :authentication
  before_action :set_chatbox

  def create
    message = @chatbox.messages.new(message_params)
    puts("#{message_params} AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
    message.user = current_user
    message.save
    MessageRelayJob.perform_later(message)
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
