class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def check_admin_status
    authenticate_user!
    redirect_to_root unless current_user.admin?
  end

  def redirect_to_root
    flash[:notice] = "Sorry, you do not have permission to do that."
    redirect_to root_path
  end
end
