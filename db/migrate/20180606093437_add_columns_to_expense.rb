class AddColumnsToExpense < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :remark, :text, after: :category
  end
end
