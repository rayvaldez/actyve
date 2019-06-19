class User < ApplicationRecord
  has_many :activities
  has_many :exercises, through: :activities

  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
