module ErrorHandler::NotAuthorized
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    sign_out current_user if current_user
    flash.alert = 'You are not authorized to perform this action.'
    redirect_to new_user_session_path
  end
end
