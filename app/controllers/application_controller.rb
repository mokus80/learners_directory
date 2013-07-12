class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #include SessionsHelper

  before_filter :current_user

  helper_method :signed_in?
  helper_method :current_user
  helper_method :current_service

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session.has_key?(:user_id)
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  def current_service
    if session.has_key?(:service_id)
      @current_service ||= Service.where(user_id: session[:user_id], id: session[:service_id]).first
    end
  rescue ActiveRecord::RecordNotFound
    session[:service_id] = nil
  end

  def current_user?
    !!current_user
  end

  def signed_in?
    current_user?
  end

  def authenticate_user!
    if session.has_key?(:user_id)
      current_user
    else
      redirect_to redirect_path
    end
  end

  def signout!
    @current_user = nil
    reset_session
  end

  def redirect_path
    :root
  end
end
