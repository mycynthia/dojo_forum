class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.page(params[:page]).per(20)
  end
  def show
    @post = Post.find(params[:id])
  end
end
