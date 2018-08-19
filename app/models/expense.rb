class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :production

  def formatted_date
    self.date.strftime("%m/%d/%y")
  end

  def money_total
    "$" + ("%.2f" % self.total)
  end


end
