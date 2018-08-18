class RemoveBudgetFromProductions < ActiveRecord::Migration[5.2]
  def change
    remove_column :productions, :budget
  end
end
