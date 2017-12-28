class AddCategoryToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :category, :integer, after: :user_id
  end
end
