class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :production

  def formatted_date
    self.date.strftime("%m/%d/%y")
  end
  
end
