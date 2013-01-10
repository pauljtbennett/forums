class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_site

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_site
    @current_site = Site.find_by_url(request.host)
  end

  helper_method :current_user
  helper_method :current_site

  def require_user
    unless current_user
      redirect_to new_session_path and return
    end
  end

  def require_site
    unless current_site
      flash[:error] = "No site found"
    end
  end
end
