class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      flash[:success] = "経費を新しく申請しました✅"
      redirect_to expense_path(@expense)
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
    case params[:status]
    when "approved"
      @expenses = @expenses.approved
    when "rejected"
      @expenses = @expenses.rejected
    when "retrieved"
      @expenses = @expenses.retrieved
    when "pending"
      @expenses = @expenses.pending
    end
    if params[:user]
      @expenses = @expenses.user(params[:user])
    end
    @expenses = @expenses.page(params[:page])
  end

  def edit
    @expense = Expense.find(params[:id])
    redirect_to root_url unless authorized?
  end

  def update
    attributes = {
      rejected_at: params[:expense][:status] == "reject" ? Time.zone.now : nil,
      approved_at: params[:expense][:status] == "approve" ? Time.zone.now : nil,
      comment: params[:expense][:comment],
      confirmed_by: current_user.id
    }
    @expense = Expense.find(params[:id])
    if @expense.update(attributes)
      redirect_to expense_path(@expense)
    else
      render 'edit'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :category, :paid_at, :paid_to, :amount, :purpose, :comment)
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
