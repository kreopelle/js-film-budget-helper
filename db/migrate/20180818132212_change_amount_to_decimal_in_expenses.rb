class ChangeAmountToDecimalInExpenses < ActiveRecord::Migration[5.2]
  def change
    change_column :expenses, :amount, :decimal, precision: 11, scale: 2
  end
end
