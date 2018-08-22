class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :production
  belongs_to :department
  enum location: [:nycloc, :nycstu, :nysloc, :nysstu]
  has_one_attached :receipt

  validates :vendor, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :department_id, presence: true
  validates :total, numericality: { greater_than: 0.01 }
  validates :location, inclusion: { in: %w(nysloc nysstu nycloc nycstu),
   message: "%{value} is not a valid location" }
   validate :correct_image_type

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

  private

  def correct_image_type
    if receipt.attached? && !receipt.content_type.in?(%w(image/jpeg image/png))
      errors.add(:receipt, 'must be a JPEG, JPG or PNG.')
    elsif receipt.attached? == false
      errors.add(:receipt, 'image required.')
    end
  end

end
