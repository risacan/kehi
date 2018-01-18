class PagesController < ApplicationController
  def index
    @expenses = current_user.expenses.order(created_at: :desc).first(5)
    @company_expenses = company_expenses
    @amount_by_category = amount_by_category
    @number_of_category = number_of_category
  end

  def show
    @amount_by_category = amount_by_category
    @amount_by_category_last_month = amount_by_category_last_month
    @number_of_category = number_of_category
  end

  private

  def amount_by_category
    current_user.company.amount_by_category
  end

  def amount_by_category_last_month
    current_user.company.amount_by_category_last_month
  end

  def number_of_category
    current_user.company.number_of_category
  end

  def company_expenses
    current_user.company.expenses
  end
end
