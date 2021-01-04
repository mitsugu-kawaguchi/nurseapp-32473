class TechniquesController < ApplicationController
  def index
    @users = User.where("nursing_history <=3")
    @techniques = Technique.all.order('priority_id DESC')
    @techniques = @search.result
    @meetings = Meeting.all
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
    respond_to do |format|
      if @technique.update(techniques_params) && @technique.video.recreate_versions!
        format.html { redirect_to @technique, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @technique.errors, status: :unprocessable_entity }
      end
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
