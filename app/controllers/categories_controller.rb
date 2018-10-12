class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @q = @category.posts.published.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(10)
  end
end
