module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    @current_user = user
    cookies.signed[:user_id] = current_user.id
  end

  def logout
    session[:user_id] = "none"
    @current_user = false
    cookies.signed[:user_id] = nil
   end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authentication
    if !current_user
      flash[:error] = "Please Login!"
      redirect_to root_path
    end
  end

  def login_params
    params.require(:user).permit(:username, :password)
  end

end
