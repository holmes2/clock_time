# == Schema Information
#
# Table name: shifts
#
#  id         :integer          not null, primary key
#  active     :boolean
#  end_time   :datetime
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_shifts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Shift < ApplicationRecord
  attribute :active, default: true
  attribute :start_time, default: Time.now.utc

  has_many :breaks
  belongs_to :user

  validate :one_active_per_user
  validates_presence_of :start_time
  validate :end_time_gt_start_time
  validates :active, inclusion: [true, false]
  validate :end_time_presence

  def clock_start_time!
    return false if self.end_time.present?

    self.start_time = Time.now.utc
    self.active = true
    save!
  end

  def clock_end_time
    return false if self.end_time.present?

    self.end_time = Time.now.utc
    self.active = false
    save!
  end

  private

  def end_time_gt_start_time
    return if self.end_time.blank? && self.start_time.blank?
    return if self.start_time <= self.end_time
    errors.add(:base, :end_time, message: "End time cannot be in the past in relation to start time")
  end

  def one_active_per_user
    return if self.end_time.present?
    errors.add(:active, :more_than_one_active_shift, message: "Shift is already active") if more_than_zero_active
  end

  def end_time_presence
    return if active
    errors.add(:base, :end_time_not_present, message: 'End time should be present') if end_time.blank?
  end

  def more_than_zero_active
    Shift.where(user_id: user_id, active: true).count > 0
  end

end
