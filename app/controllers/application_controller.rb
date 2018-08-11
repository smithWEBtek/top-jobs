class ApplicationController < ActionController::Base
   # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit 
  protect_from_forgery with: :exception

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def logged_in?
    !!current_user 
  end 

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private 

  def user_not_authorized 
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to user_path(@user)
  end

  def require_login
    unless logged_in?
      flash[:notice] = "Please log in to view this page"
      redirect_to root_path
    end
  end

  def set_user 
    @user = current_user 
  end
  
end
