class ChangeBudgetToDecimalInProductions < ActiveRecord::Migration[5.2]
  def change
    change_column :productions, :budget, :decimal, precision: 11, scale: 2 
  end
end
