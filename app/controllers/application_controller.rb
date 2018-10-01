class ApplicationController < ActionController::Base
include SessionsHelper
 def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  def admin_user
      redirect_to(root_path) unless current_user.is_admin?
  end

end
