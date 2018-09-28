class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  def index
    @posts = Post.page(params[:page]).per(12)
  end
  def show
    # set_post
  end
  def edit
    # set_post
  end
  def new
    @post = Post.new
  end
  def update
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated"
      redirect_to post_path(@post) 
    else
      flash.now[:alert] = "Post was failed to update"
      render :edit
    end
  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Posted successfully"
      redirect_to post_path
    else
      flash.now[:alert] = "Posted faield"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end