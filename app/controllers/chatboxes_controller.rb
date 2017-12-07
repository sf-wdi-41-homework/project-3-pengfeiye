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

    if @user == nil && @chatbox.save && current_user.chatboxes << @chatbox
      flash[:success] = "#{@chatbox.name} chatbox was just created"
      redirect_to chatbox_path(@chatbox.id)
    elsif @chatbox.save && current_user.chatboxes << @chatbox && @user.chatboxes << @chatbox
      flash[:success] = "#{@chatbox.name} chatbox was just created"
      redirect_to chatboxes_path
    else
      flash[:error] = "Chatbox creation failed, please try again"
      redirect_to new_chatbox_path
    end
  end

  def show
  end

  def edit
    @chatboxuser = [];
    @chatbox.users.each do |user|
      if @allusers.include? user.username
        @allusers.delete(user.username)
      end
    end

  end

  def update
    @user = User.find_by_username(params[:chatboxes][:username])
    if @user == nil && @chatbox.update(chatbox_params)
      redirect_to @chatbox
    elsif @chatbox.update(chatbox_params) && @user.chatboxes << @chatbox
      redirect_to chatboxes_path
    else
      redirect_to new_chatbox_path
    end
  end

  def destroy
    @chatbox.destroy
  end

  private
  def chatbox_params
    params.require(:chatboxes).permit(:name)
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
