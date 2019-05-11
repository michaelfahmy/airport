class ApplicationController < ActionController::Base
  include Pundit
  include ErrorHandler::NotAuthorized

  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_time_zone, if: :current_user

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
