class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :title, presence: true
  validates :hour, numericality: { more_than_or_equal_to: 0}
  validates :minute, numericality: { less_than_or_equal_to: 60}
  validates :distance, :hour, :calories, numericality: {allow_nil: true }

end
