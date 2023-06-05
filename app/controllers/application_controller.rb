class ApplicationController < ActionController::Base

    # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def index
    render layout: false
  end

  protected

  def after_sign_in_path_for(users)
    projects_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
    
end


# class ApplicationController < ActionController::Base
#   layout "application"
#   protect_from_forgery with: :exception

#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#       devise_parameter_sanitizer.permit(:account_update, keys: [:name])
#   end
# end