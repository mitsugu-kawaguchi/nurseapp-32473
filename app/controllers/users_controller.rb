class UsersController < ApplicationController
  def show
    @Techniques = Technique.all
    @user = User.find(params[:id])
    @techniques = @user.techniques
    @complete_techniques = @user.completes.map{|complete| complete.technique}
    @post = Post.new
  end
end
