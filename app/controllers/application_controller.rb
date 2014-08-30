class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_login
    redirect_to new_session_path if session[:user_id].blank?
  end

  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
