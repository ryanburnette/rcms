class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception

  private
    def require_super_admin!
      if current_admin_user.nil? || current_admin_user.role != "superadmin"
        redirect_to admin_posts_path, :alert => "You need to be super to do that."
      end 
    end
end
