class ApplicationController < ActionController::Base
  before_filter :confifure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      root_path
    else
      search_path
    end
  end

  protected

  def confifure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :second_name])
  end
end
