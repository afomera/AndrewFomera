class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery(with: :exception)
  layout(:by_resource)

  before_action(:configure_permitted_parameters, if: :devise_controller?)

  private

  def by_resource
    guest? ? 'unauthenticated' : 'application'
  end

  def guest?
    devise_controller? && !user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  def check_admin_status
    authenticate_user!
    redirect_to_root unless current_user.admin?
  end

  def redirect_to_root
    flash[:notice] = "Sorry, you do not have permission to do that."
    redirect_to root_path
  end
end
