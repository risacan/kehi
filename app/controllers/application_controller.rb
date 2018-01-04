class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :ensure_belongs_to_company
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def ensure_belongs_to_company
    if user_signed_in? && current_user.company_id.nil?
      redirect_to new_company_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
