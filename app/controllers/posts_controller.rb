class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.page(params[:page]).per(12)
  end
  def show
    # set_post
  end
  def edit
    # set_post
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
