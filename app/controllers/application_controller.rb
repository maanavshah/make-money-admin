class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to :new_user_session_path, status: :forbidden
    end
  end
end
