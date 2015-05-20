class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @controller=controller_name
   protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:email,:phone_number,:role,:base_rate,:bedroom_rate,:bathroom_rate,:zipcode,:password,:password_confirmation) }
  end
end

