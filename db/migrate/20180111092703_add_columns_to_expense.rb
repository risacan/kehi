class AddColumnsToExpense < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :paid_at, :datetime, after: :category
    add_column :expenses, :paid_to, :string, after: :paid_at
    add_column :expenses, :amount, :integer, after: :paid_to
    add_column :expenses, :confirmed_by, :integer, after: :rejected_at
    add_column :expenses, :comment, :text, after: :confirmed_by
    add_column :expenses, :purpose, :text, after: :title
  end
end
