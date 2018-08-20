class AddDepartmentIdToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :department_id, :integer
  end
end
