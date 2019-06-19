class Exercise < ApplicationRecord
  has_many :activities
  has_many :users, through: :activities

  validates :name, presence: true
  validates :name, uniqueness: true
end
