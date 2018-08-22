class ChangeNysAcctToBeStringInDepartments < ActiveRecord::Migration[5.2]
  def change
    change_column :departments, :nys_acct, :string
  end
end
