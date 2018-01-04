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
    redirect_to root_url unless authorized?
  end

  def index
    if current_user.admin?
      @expenses = current_user.company.expenses
    else
      @expenses = current_user.expenses
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :category)
  end

  def authorized?
    same_user? || admin_at_same_company?
  end

  def same_user?
    @expense.user == current_user
  end

  def admin_at_same_company?
    current_user.admin? && same_company?
  end

  def same_company?
    @expense.user.company == current_user.company
  end
end
