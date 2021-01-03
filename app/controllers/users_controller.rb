class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @techniques = Technique.all
    @comment = Comment.new
    @comments = @user.comments
  end
end
