class UsersController < ApplicationController
  before_action :set_user, only: [:show, :mycomments]

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

  private

  def set_user
    @user = User.find(params[:id])
  end
end