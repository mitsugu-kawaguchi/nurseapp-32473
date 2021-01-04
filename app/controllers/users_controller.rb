class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @techniques = Technique.all
    @posts = Post.all
    @post = Post.new
  end
end
