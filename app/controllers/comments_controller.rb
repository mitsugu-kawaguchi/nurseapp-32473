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

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      render "posts/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    unless @comment.user_id == current_user.id
      redirect_to action: :show
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.update(comments_params)
      redirect_back(fallback_location: root_path)
    else
      render "posts/show"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
