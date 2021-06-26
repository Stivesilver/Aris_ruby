class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # include SessionsHelper

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) do
      |u| u.permit(registration_params << :current_password)
      end
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) do
      |u| u.permit(registration_params)
      end
    end
  end

  private

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
