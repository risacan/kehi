class PagesController < ApplicationController
  def index
    @expenses = current_user.expenses.order(created_at: :desc).first(5)
    @count_by_category = current_user.company.expenses.group(:category).count.map{|k,v| [I18n.t(k, scope: "enums.expense.category"), v]}.to_h
    @pie_chart = current_user.company.expenses.approved.group(:category).sum(:amount).map{|k,v| [I18n.t(k, scope: "enums.expense.category"), v]}.to_h
  end

  def show
  end
end
