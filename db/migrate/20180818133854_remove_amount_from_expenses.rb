class RemoveAmountFromExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :amount
  end
end
