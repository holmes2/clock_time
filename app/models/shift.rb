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

  private

  def one_active_per_user
    return if self.end_time.present?
    errors.add(:active, :more_than_one_active_shift, message: "Shift is already active") if more_than_zero_active
  end

  def more_than_zero_active
    Shift.where(user_id: user_id, active: true).count > 0
  end

end
