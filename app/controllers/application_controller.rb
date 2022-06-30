class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!, except: [:about, :welcome]
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    current_user
  end

  def user_not_authorized
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
