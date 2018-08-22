class Expense < ApplicationRecord

  enum location: [:nycloc, :nycstu, :nysloc, :nysstu]

  belongs_to :user
  belongs_to :production
  belongs_to :department

  has_one_attached :receipt

  validates :vendor, presence: true
  validates :date, presence: true
  validates :department_id, presence: true
  validates :department, presence: true, if: -> { department_id.present? }
  validates :production_id, presence: true
  validates :production, presence: true, if: -> { production_id.present? }
  validates :total, numericality: { greater_than: 0.01 }
  validates :location, inclusion: { in: %w(nysloc nysstu nycloc nycstu),
   message: "%{value} is not a valid location" }
   validate :correct_image_type

   # scope :pending -> {where(pending: true)}
   # scope :approved -> {where(pending: false)}

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

  private

  def correct_image_type
    if receipt.attached? && !receipt.content_type.in?(%w(image/jpeg image/png))
      errors.add(:receipt, 'must be a JPEG, JPG or PNG.')
    elsif receipt.attached? == false
      errors.add(:receipt, 'image required.')
    end
  end

end
