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
  has_many :breaks
  belongs_to :user

  # validates: :one_active_per_user
  validates_presence_of: :start_time

  def one_active_per_user
    errors.add(:shift_already_active, :acitve, "Shift is already active") if active?
  end

end
