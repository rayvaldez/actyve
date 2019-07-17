class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :title, presence: true
  validates :hour, :minute, numericality: { more_than_or_equal_to: 0}
  validates :minute, numericality: { less_than_or_equal_to: 60}
  validates :distance, :hour, :calories, numericality: {allow_nil: true }


  scope :user_activities, -> (user) {where(user_id: user)}
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

end
