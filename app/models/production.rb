class Production < ApplicationRecord
  has_many :expenses
  has_many :users, through: :expenses

  def dollar_budget
      "$" + ("%.2f" % self.budget)
  end

end
