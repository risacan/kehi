class Api::ExpensesController < ApplicationController
  def show
    @expense = Expense.find(params[:id])
    render "show", formats: "json", handlers: "jbuilder"
  end
end