class AddBudgetToProductions < ActiveRecord::Migration[5.2]
  def change
    add_column :productions, :budget, :decimal, precision: 10, scale: 2
  end
end
