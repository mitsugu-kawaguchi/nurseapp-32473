class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
