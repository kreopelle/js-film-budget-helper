class RemoveDepartmentFromExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :department
  end
end
