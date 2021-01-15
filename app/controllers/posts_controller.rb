class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id = @post.user_id
      @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
end
