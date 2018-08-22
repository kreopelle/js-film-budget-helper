class User < ApplicationRecord
  has_many :expenses
  has_many :productions, through: :expenses

  validates :name, presence: true
  validates :email, presence: true

  has_secure_password

  def find_or_create_by_omniauth
    User.find_or_create_by(uid: auth_hash["uid"]) do |u|
      u.uid = auth_hash["uid"]
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["info"]["email"]
      u.password = SecureRandom.hex
    end
  end

end
