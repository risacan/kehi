class RenameRemarkColumnToExpenses < ActiveRecord::Migration[5.1]
  def change
    rename_column :expenses, :remark, :category_other_detail
  end
end
