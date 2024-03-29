class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    session[:library_id] = resource.library_id
    if resource.type == "Admin"
      admin_path(resource)
    elsif resource.type == "Manager"
      manager_path(resource)
    elsif resource.type == "Issuer"
      issuer_path(resource)
    end

  end

  def after_sign_out_path_for(resource)
    libraries_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname,:lname,:status,:image,:balance,:library_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:library_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname,:lname,:status,:image,:balance,:library_id])

  end
end
