class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_to controller: :users, action: :show, id: @comment.user_id
    else
      @user = @comment.user
      @comments = @user.comments
      render "users/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to controller: :users, action: :show, id: @comment.user_id
    else
      render "users/show"
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
      redirect_to controller: :users, action: :show, id: @comment.user_id
    else
      render "users/show"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

end
