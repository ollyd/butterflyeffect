class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  private

  def authenticate
    if session[:user_id].present?
      @current_user = User.where(:id => session[:user_id]).first
      session[:user_id] = nil unless @current_user
    end
  end
  
end
