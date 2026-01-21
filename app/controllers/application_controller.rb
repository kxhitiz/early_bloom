class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please log in to continue"
      return false
    end
    true
  end

  def require_child_profile
    unless current_user&.child_profiles&.any?
      redirect_to new_child_profile_path, alert: "Please create a child profile to continue"
      return false
    end
    true
  end
end
