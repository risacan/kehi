class PagesController < ApplicationController
  def index
    @expenses = current_user.expenses
  end

  def show
  end
end
