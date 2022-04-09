class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_notifications

  protected

  def load_notifications
    @notifications = Notification.where(recipient: current_user)
  end
		
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :avatar, :remember_me]    
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
