class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :search_technique


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:nursing_history,:ward_id])
  end

  def search_technique
    @search = Technique.ransack(params[:q])
    @techniques = @search.result
  end
end
