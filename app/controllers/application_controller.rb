class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_site

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def current_site
    @current_site = Site.find_by_url(request.host)
  end

  helper_method :current_user
  helper_method :current_site

  def require_user
    unless current_user
      redirect_to new_session_path(:from => request.fullpath) and return
    end
  end

  def require_site
    unless current_site
      flash[:error] = "No site found"
    end
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
  end

  helper_method :avatar_url
end
