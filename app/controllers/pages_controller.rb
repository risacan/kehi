class PagesController < ApplicationController
  def index
    @my_latest_expenses = current_user.expenses.order(created_at: :desc).first(10)
    @company_latest_expenses = company_expenses.order(created_at: :desc).first(10)
    @my_expenses = current_user.expenses
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
    company_expenses.this_month.group_by_category.sum(:amount)
  end

  def amount_by_category_last_month
    company_expenses.this_month(Time.zone.now.last_month).group_by_category.sum(:amount)
  end

  def number_of_category
    company_expenses.this_month.group_by_category.count
  end

  def company_expenses
    current_user.company.expenses.countable
  end
end
