class PagesController < ApplicationController
  def index
    @expenses = current_user.expenses.order(created_at: :desc).first(5)
  end

  def show
  end
end
