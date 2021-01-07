class CompletesController < ApplicationController
  def create
    complete = current_user.completes.build(technique_id: params[:technique_id])
    complete.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    complete = Complete.find_by(technique_id: params[:technique_id], user_id: current_user.id)
    complete.destroy
    redirect_back(fallback_location: root_path)
  end
end
