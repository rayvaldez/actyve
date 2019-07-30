class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :title, presence: true
  validates :hour, :minute, :calories, :distance, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true}
  validates :minute, numericality: { less_than_or_equal_to: 60, allow_nil: true}


  scope :user_activities, -> (user) {where(user_id: user)}
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

end
