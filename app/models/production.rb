class Production < ApplicationRecord
  has_many :expenses
  has_many :users, through: :expenses

  validates :name, presence: true
  validates :budget, presence: true
  validates :budget, numericality: { greater_than: 100 }

  def dollar_budget
      "$" + ("%.2f" % self.budget)
  end

  def approved_expenses
    self.expenses.approved
  end

end
