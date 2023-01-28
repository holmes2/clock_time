# == Schema Information
#
# Table name: breaks
#
#  id         :integer          not null, primary key
#  active     :boolean
#  end_time   :datetime
#  start_time :datetime
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shift_id   :integer          not null
#
# Indexes
#
#  index_breaks_on_shift_id  (shift_id)
#
# Foreign Keys
#
#  shift_id  (shift_id => shifts.id)
#
class Break < ApplicationRecord
  include Clockable

  belongs_to :shift

  validate :one_active_per_shift
  validate :should_have_active_shift

  private

  def one_active_per_shift
    return if self.end_time.present?
    errors.add(:active, :more_than_one_active_break, message: "Only one active break is allowed.") if more_than_zero_active
  end

  def more_than_zero_active
    Break.where(shift_id: shift_id, active: true).count > 0
  end

  def should_have_active_shift
    self.shift.active
  end

end
