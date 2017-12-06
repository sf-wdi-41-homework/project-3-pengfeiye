class UserchatboxesController < ApplicationController
  before_action :authentication
  before_action :set_chatbox

  def create
    @chatbox_user = @chatbox.where(user_id: current_user.id).first_or_create
    redirect_to @chatbox
  end

  def destroy
    @chatbox_user = @chatbox.where(user_id: current_user.id).destroy_all
    redirect_to chatboxes_path

  end


end
