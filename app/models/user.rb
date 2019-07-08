class User < ApplicationRecord
  has_many :activities
  has_many :exercises, through: :activities

  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.username = auth_hash["info"]["nickname"]
    end
  end
end
