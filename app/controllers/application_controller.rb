class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :flock_name,
      :name,
      :phone,
      :fax
    ]
  end
end
