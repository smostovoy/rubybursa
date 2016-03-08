class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end
  helper_method :current_user

  def authorize_user
    if current_user.nil?
      redirect_to root_path, notice: 'не залогинен'
    end
  end
end
