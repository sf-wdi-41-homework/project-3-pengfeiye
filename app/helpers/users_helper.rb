module UsersHelper
  def user_params
    params.require(:user).permit(:username, :password, :confirm_password)
  end

end
