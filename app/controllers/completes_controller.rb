class CompletesController < ApplicationController
  def create
    complete = current_user.completes.build(technique_id: params[:technique_id])
    complete.save(complete_params)
    redirect_to techniques_path
  end

  def destroy
    complete = Complete.find_by(technique_id: params[:technique_id], user_id: current_user.id)
    complete.destroy
    redirect_to techniques_path
  end

  def complete_params
    params.require(:complete).permit(:completed)
  end
end
