class ChangeLocationToBeIntegerInExpenses < ActiveRecord::Migration[5.2]
  def change
    change_column :expenses, :location, :integer
  end
end
