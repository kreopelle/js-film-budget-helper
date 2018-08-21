class User < ApplicationRecord
  has_many :expenses
  has_many :productions, through: :expenses
  validates :email, uniqueness: true
  validates :role, presence: true
  validates :name, presence: true
  

  has_secure_password
end
