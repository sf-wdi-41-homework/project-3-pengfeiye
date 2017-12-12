class ChatboxesController < ApplicationController
  before_action :authentication
  before_action :chatposition
  before_action :chatbox, only: [:update, :show, :edit, :destroy]
  before_action :allusers

  def index
  end

  def new
    @chatbox = Chatbox.new
  end

  def create
    @user = User.find_by_username(params[:chatboxes][:username])
    @chatbox = Chatbox.new(chatbox_params)
    @chatbox.owner_id = current_user.id


    Chatbox.all.each do |chat|
      two_chats = chat.users.length == 2
      has_current_user = chat.users.include?(current_user)
      has_searched_user = chat.users.include?(@user)

      current_user_private_chat = two_chats && has_current_user

      chat_with_current_searched = current_user_private_chat && has_searched_user
      if chat_with_current_searched
        @alreadyexist = chat
      end
    end

    if @user == nil && @chatbox.save && current_user.chatboxes << @chatbox
      redirect_to chatbox_path(@chatbox.id)
    elsif @alreadyexist
      redirect_to chatbox_path(@alreadyexist.id)
    elsif @chatbox.save && current_user.chatboxes << @chatbox && @user.chatboxes << @chatbox
      redirect_to chatbox_path(@chatbox.id)
    else
      flash[:error] = "Chatbox creation failed, please try again"
      redirect_to new_chatbox_path
    end
  end

  def show
    @created_ats = @chatbox.messages.group_by { |c| c.created_at.localtime.strftime("%B %e %Y") }
    if !current_user.chatboxes.include?@chatbox
      redirect_to chatboxes_path
    end
  end

  def edit
    @chatboxuser = [];
    @chatbox.users.each do |user|
      if @allusers.include? user.username
        @allusers.delete(user.username)
      end
    end

    @pendingUser = []
    @chatbox.pending.each do |id|
      @pendingUser << User.find(id)
    end

  end

  def update
    @user = User.find_by_username(params[:chatboxes][:username])
    if @user == nil && @chatbox.update(chatbox_params)
      redirect_to @chatbox
    elsif @chatbox.update(chatbox_params) && @user.chatboxes << @chatbox
      redirect_to @chatbox
    else
      redirect_to new_chatbox_path
    end
  end

  def destroy
    if @chatbox.users.length <= 1
      @chatbox.destroy
      flash[:success] ="#{@chatbox.name} has been shut down!"
      redirect_to chatboxes_path
    else
      @chatbox.users.delete(current_user.id)
      flash[:success] ="You have left #{@chatbox.name} TXTChat :("
      redirect_to chatboxes_path
    end
  end

  def addgroup
    @chatbox = Chatbox.find(params[:id])
    @chatbox.pending << current_user.id
    if @chatbox.save
      flash[:success] = "Your application to join #{@chatbox.name} has been sent!"
      redirect_to chatboxes_path
    end
  end

  def approve
    @approveUser = User.find(params[:id])
    @chatbox = Chatbox.find(params[:group])

    if @chatbox.users << @approveUser
      @chatbox.pending.delete(@approveUser.id)
      @chatbox.save
      flash[:success] ="#{@approveUser.username.capitalize} has joined #{@chatbox.name} TXTChat group"
      redirect_to edit_chatbox_path(@chatbox.id)
    end
  end

  private
  def chatbox_params
    params.require(:chatboxes).permit(:name, :chatType)
  end

  def chatbox
    @chatbox = Chatbox.find(params[:id])
  end

  def allusers
    @allusers = ["None"]
    User.all.each do |user|
      if user == current_user
      else
        @allusers << user.username
      end
    end
  end
end
