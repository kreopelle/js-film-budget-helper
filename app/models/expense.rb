class Expense < ApplicationRecord

  enum location: [:nycloc, :nycstu, :nysloc, :nysstu]
  enum status: [:pending, :approved, :rejected]

  belongs_to :user
  belongs_to :production
  belongs_to :department

  has_one_attached :receipt

  validates :date, presence: true
  validates :department_id, presence: true
  validates :department, presence: true, if: -> { department_id.present? }
  validates :location, presence: true
  validates :location, inclusion: { in: %w(nysloc nysstu nycloc nycstu),
   message: "%{value} is not a valid location" }
  validates :production_id, presence: true
  validates :production, presence: true, if: -> { production_id.present? }
  validates :status, presence: true
  validates :status, inclusion: { in: %w(pending approved rejected), message: "%{value} is not a valid status"}
  validates :total, numericality: { greater_than: 0.01 }
  validates :vendor, presence: true

  validate :correct_image_type

  scope :pending, -> {where(status: "pending")}
  scope :approved, -> {where(status: "approved")}
  scope :rejected, -> {where(status: "rejected")}

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
