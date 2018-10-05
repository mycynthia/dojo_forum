class CommentsController < ApplicationController
  before_action :set_post_comment, only: [:create, :destroy]
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to post_path(@post)
  end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user = current_user
      @comment.destroy
      redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  def set_post_comment
    @post = Post.find(params[:post_id])
  end
end