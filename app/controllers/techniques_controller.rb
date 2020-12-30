class TechniquesController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
    @techniques = Technique.all
  end

  def new
    @technique = Technique.new
  end

  def create
    @technique = Technique.new(techniques_params)
    if @technique.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @technique = Technique.find(params[:id])
  end

  def edit
    @technique = Technique.find(params[:id])
    unless current_user.nursing_history >= 4
      redirect_to root_path
    end
  end

  def update
    @technique = Technique.find(params[:id])
    if @technique.update(techniques_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @technique = Technique.find(params[:id])
    if current_user.nursing_history >= 4
      @technique.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def techniques_params
    params.require(:technique).permit(:title, :priority_id, :description, :target_at, :completed_at, :video).merge(user_id: current_user.id)
  end
end
