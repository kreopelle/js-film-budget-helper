class AddAmountToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :total, :decimal, precision: 10, scale: 2
  end
end
