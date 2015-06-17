class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :un_authenticated_visitor?
  helper_method :current_user
  helper_method :current_user?
  helper_method :current_admin?

  def current_user
    @current_user ||= @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    current_user && session[:user_id] != nil
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
