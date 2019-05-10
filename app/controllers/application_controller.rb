class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_time_zone, if: :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end

  def user_not_authorized
    sign_out current_user if current_user
    flash.alert = 'You are not authorized to perform this action.'
    redirect_to new_user_session_path
  end
end
