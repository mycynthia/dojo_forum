class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.page(params[:page]).per(20)
    @categories = Category.all
  end
  def show
    # set_post
    @comments = Comment.page(params[:page]).per(20)
    if params[:c_id]
      @comment = Comment.find(params[:c_id])
    else
      @comment = Comment.new
    end
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
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Posted successfully"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Posted faield"
      render :new
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:alert] = "Post was deleted"
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :image, category_ids:[])
  end
  def set_post
    @post = Post.find(params[:id])
  end
end