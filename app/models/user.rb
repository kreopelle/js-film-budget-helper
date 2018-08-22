class User < ApplicationRecord
  has_many :expenses
  has_many :productions, through: :expenses

  validates :name, presence: true
  validates :email, presence: true

  has_secure_password

end
