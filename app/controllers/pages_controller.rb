class PagesController < ApplicationController
  def index
    @expenses = current_user.expenses.order(created_at: :desc)
  end

  def show
  end
end
