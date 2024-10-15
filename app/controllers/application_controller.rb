class ApplicationController < ActionController::Base
  helper_method :current_user
  skip_before_action :verify_authenticity_token

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def reject_user
    redirect_to root_path, alert: 'Доступ запрещен!'
  end
end
