class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?

  # filter in Flickr version
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :avatar])
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:username, :password, :password_confirmation, :current_password)
    }
  end
end
