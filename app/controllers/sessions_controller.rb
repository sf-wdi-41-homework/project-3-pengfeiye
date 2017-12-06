class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # confirm that email/password combination is correct
    @user = User.find_by_username(login_params[:username])

    if @user && @user.authenticate(login_params[:password])
      login(@user)
      flash[:success] = "Successfully logged in."
      puts (@current_user.username)     # <--- Add this flash notice
      # redirect_to show_user_path(@user[:id])
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password"      # <--- Add this flash notice

      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "Successfully logged out."        # <--- Add this flash notice
    redirect_to root_path
  end

end
