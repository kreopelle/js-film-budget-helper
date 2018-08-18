class Production < ApplicationRecord
  has_many :expenses
  has_many :users, through: :expenses

  def dollar_budget
    self.budget.truncate.to_s + '.' + sprintf('%02d', (expense.amount.frac * 100).truncate)
  end

end
