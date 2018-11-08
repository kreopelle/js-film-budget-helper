class Expense < ApplicationRecord

  belongs_to :user
  belongs_to :production
  belongs_to :department

  validates :date, presence: true
  validates :department_id, presence: true
  validates :department, presence: true, if: -> { department_id.present? }
  validates :production_id, presence: true
  validates :production, presence: true, if: -> { production_id.present? }
  validates :total, numericality: { greater_than: 0.01 }
  validates :vendor, presence: true

  def formatted_date
    self.date.strftime("%m/%d/%y")
  end

  def dollar_total
    "$" + ("%.2f" % self.total)
  end

  def department_category
    if self.department_id != nil
      self.department.category
    end
  end

  def user_name
    self.user.name
  end

  def production_name
    self.production.name
  end

  def next
    expense = self.user.expenses.where("id > ?", id).first
    if expense
      expense
    else
      self.user.expenses.first
    end
  end

end
