class Company < ApplicationRecord
  has_many :users
  validates :name, presence: true

  def expenses
    Expense.where(user: users)
  end
end
