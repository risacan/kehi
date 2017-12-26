class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :ensure_belongs_to_company

  private

  def ensure_belongs_to_company
    if user_signed_in? && current_user.company_id.nil?
      redirect_to new_company_path
    end
  end
end
