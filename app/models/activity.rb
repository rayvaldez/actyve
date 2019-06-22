class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :minute, numericality: { less_than_or_equal_to: 60}
  validates :distance, :hour, :calories, numericality: { only_integer: true}

end
