class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :category
      t.integer :nys_acct

      t.timestamps
    end
  end
end
