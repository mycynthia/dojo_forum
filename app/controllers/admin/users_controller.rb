class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all

    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "User's role was successfully update"
    else
       flash[:alert] = "User's role was failed to update"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
