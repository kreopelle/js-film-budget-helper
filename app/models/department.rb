class Department < ApplicationRecord

  has_many :expenses

  validates :category, uniqueness: true
  validates :nys_acct, uniqueness: true
  validates :nys_acct, format: { with: /\d{3}-\d{2}/, on: :create }


end
