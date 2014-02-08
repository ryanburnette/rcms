class ApplicationController < ActionController::Base

  protect_from_forgery :with => :exception

  helper_method :roles_available, :post_statuses, :admin_nav_class

  def roles_available
    [
      ['None', ''],
      ['Super', 'super']
    ]
  end

  def post_statuses
    [
      ['Draft', 'draft'],
      ['Pending', 'pending'],
      ['Published', 'published']
    ]
  end

  def admin_nav_class(params,current_controller,current_action=nil)
    if params[:controller] == current_controller && current_action == nil
      "active"
    elsif params[:controller] == current_controller && current_action == params[:action]
      "active"
    end
  end

  private

  def require_super_admin!
    if current_admin_user.nil? || current_admin_user.role != "super"
      redirect_to admin_posts_path, :alert => "You need to be super to do that."
    end 
  end

end
