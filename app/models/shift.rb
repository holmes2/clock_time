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
  include Clockable
  attribute :active, default: true

  has_many :normal_breaks, class_name: 'NormalBreak'
  has_one :lunch_break, class_name: 'LunchBreak'
  belongs_to :user

  validate :one_active_per_user
  validate :can_shift_end, if: :active_break

  def active_break
    return self.lunch_break if self.lunch_break.present? && self.lunch_break.active

    active_breaks = self.normal_breaks.where(active: true)
    return active_breaks.first if active_breaks.count > 0
    nil
  end

  private

  def one_active_per_user
    return if self.end_time.present?
    errors.add(:active, :more_than_one_active_shift, message: "Shift is already active") if more_than_zero_active
  end

  def more_than_zero_active
    Shift.where(user_id: user_id, active: true).count > 0
  end

  def can_shift_end
    debugger
    errors.add(:base, :active_break, message: 'Active break in progress cannot end shift')
  end

end
