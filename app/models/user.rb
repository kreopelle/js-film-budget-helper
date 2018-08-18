class User < ApplicationRecord
  has_many :expenses
  has_many :productions, through: :expenses 

  has_secure_password
end
