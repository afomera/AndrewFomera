class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def check_admin_status
      authenticate_user!
      if current_user.admin
        return
      else
        redirect_to root_path, notice: "Sorry, you do not have permission to do that."
      end
    end
end
