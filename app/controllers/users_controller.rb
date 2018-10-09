class UsersController < ApplicationController
  before_action :set_user, only: [:show, :mycomments, :edit, :update]

  def show
    @posts = @user.posts.order(created_at: :desc)
  end
  def mycomments
    @comments = @user.comments.page(params[:page]).per(20)
    if params[:c_id]
      @comment = Comment.find(params[:c_id])
    else
      @comment = Comment.new
    end
  end
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end