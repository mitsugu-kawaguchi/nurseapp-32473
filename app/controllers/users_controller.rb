class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @techniques = Technique.all
    @post = Post.new
  end
end
