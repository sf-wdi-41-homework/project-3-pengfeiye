module UserchatboxesHelper
  def set_chatbox
    @chatbox = Chatbox.find(params[:chatbox_id])
  end
end
