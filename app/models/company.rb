class Company < ApplicationRecord
  has_many :users
  validates :name, presence: true

  def expenses
    Expense.where(user: users)
  end

  def amount_by_category
    Expense.where(user: users).this_month.group(:category).sum(:amount)
  end

  def amount_by_category_last_month
    Expense.where(user: users).this_month(Time.zone.now.last_month).group(:category).sum(:amount)
  end

  def number_of_category
    Expense.where(user: users).this_month.group(:category).count
  end
end
