class CompaniesController < ApplicationController
  skip_before_action :ensure_belongs_to_company

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    current_user.company = @company
    if current_user.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
