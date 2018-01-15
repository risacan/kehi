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
      @expenses = current_user.company.expenses.order(created_at: :desc)
    else
      @expenses = current_user.expenses.order(created_at: :desc)
    end
  end

  def approve
    @expense = Expense.find(params[:id])
    @expense.approved_at = Time.zone.now
    @expense.confirmed_by = current_user.id
    if @expense.save
      flash[:success] = "承認しました✅"
      redirect_to expense_path(@expense)
    else
      flash[:success] = "承認できませんでした..."
      redirect_to expense_path(@expense)
    end
  end

  def reject
    @expense = Expense.find(params[:id])
    @expense.rejected_at = Time.zone.now
    @expense.confirmed_by = current_user.id
    if @expense.save
      flash[:success] = "却下しました✅"
      redirect_to expense_path(@expense)
    else
      flash[:success] = "却下できませんでした..."
      redirect_to expense_path(@expense)
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
