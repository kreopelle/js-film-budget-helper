class User < ApplicationRecord
  has_many :expenses
  has_many :productions, through: :expenses

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true

  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    self.find_or_create_by(uid: auth_hash["uid"]) do |u|
      u.uid = auth_hash["uid"]
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["info"]["email"]
      u.password = SecureRandom.hex
    end
  end

  def owns_expense(expense)
    self.expenses.include?(expense)
  end

  def last_production
    if self.expenses.any?
      self.expenses.last.production
    end
  end

  def last_production_name
    if last_production
      self.last_production.name
    end
  end

end
