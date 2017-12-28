class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @expense = Expense.find(params[:id])
    redirect_to root_url unless same_company? && current_user.admin?
  end

  def index
    @expenses = current_user.company.expenses
    redirect_to root_url unless current_user.admin?
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :category)
  end

  def same_company?
    @expense.user.company == current_user.company
  end
end
