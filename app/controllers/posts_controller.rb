class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    # @posts = Post.order(created_at: :desc).page(params[:page]).per(20)
    @categories = Category.all
    @q = Post.published.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end
  def show
    # set_post
    if params[:c_id]
      @comment = Comment.find(params[:c_id])
    else
      @comment = Comment.new
    end
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(20)
    @post.viewed_count += 1
    @post.save!
  end
  def edit
    # set_post
  end
  def new
    @post = current_user.posts.build

  end
  def update
    @post.published_at = Time.zone.now if publishing?
    @post.published_at = nil if saving_draft?

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
    @post.published_at = Time.zone.now if publishing?
    @post.replied_at = Time.zone.now
    
    if @post.save
      flash[:notice] = "Posted successfully"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Posted faield"
      render :new
    end
  end

  def destroy
    if current_user.admin? || @post.user == current_user
      @post.destroy
      redirect_to posts_path(@post)
      flash[:alert] = "Post was deleted"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :image, category_ids:[])
  end
  def set_post
    @post = Post.find(params[:id])
  end
  def publishing?
    params[:commit] == "Publish"
  end
  def saving_draft?
    params[:commit] == "Save a Draft"
  end
end