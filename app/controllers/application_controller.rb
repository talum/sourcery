class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  
  def login_required
   if !logged_in?
     redirect_to root_path, :notice => "You need to log in"
   end
  end

  def current_user
    if @current_user
      @current_user
    elsif session[:user_id]
      @current_user = User.find(session[:user_id])
    elsif params[:id]
      User.find(params[:id])
    end
  end

  def logged_in?
    !!(@current_user)
  end
end
