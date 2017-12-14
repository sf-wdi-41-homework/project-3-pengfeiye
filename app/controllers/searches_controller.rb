class SearchesController < ApplicationController
  before_action :authentication
  before_action :chatposition

  def create
    redirect_to search_result_path(search_params[:search])
  end
  def show
    @searchUser = []
    @searchGroup = []
    User.all.each do |user|
      if user.username.downcase.include? params[:search].downcase
        @searchUser << user
      end
    end
    Chatbox.all.each do |chat|
      if chat.chatType == "GroupTxt"
        if chat.name.downcase.include? params[:search].downcase
          if !chat.users.include? current_user
            @searchGroup << chat
          end
        end
      end
    end
  end

  private
  def search_params
    params.permit(:search)
  end
end
