class AddColumnsToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :approved_at, :datetime, after: :category
    add_column :expenses, :rejected_at, :datetime, after: :approved_at
  end
end
