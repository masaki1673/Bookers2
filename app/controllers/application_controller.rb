class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery
  # skip_before_filter :verify_anthenticity_token
  #protect_from_forgery
  protected

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
