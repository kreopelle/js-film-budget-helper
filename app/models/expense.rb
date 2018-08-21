class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :production
  enum location: [:nycloc, :nycstu, :nysloc, :nysstu]

  validates :vendor, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :total, numericality: { greater_than: 0.01 }
  

  def formatted_date
    self.date.strftime("%m/%d/%y")
  end

  def dollar_total
    "$" + ("%.2f" % self.total)
  end

  def department_category
    if self.department_id != nil
      Department.find(self.department_id).category
    end
  end

end
