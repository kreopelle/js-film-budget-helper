class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.string :vendor
      t.datetime :date
      t.string :location
      t.string :department
      t.integer :user_id
      t.integer :production_id

      t.timestamps
    end
  end
end
