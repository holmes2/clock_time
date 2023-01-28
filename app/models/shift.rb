# == Schema Information
#
# Table name: shifts
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  active     :boolean
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Shift < ApplicationRecord
  has_many :breaks
  belongs_to :user

  # validates: :one_active_per_user

  def one_active_per_user
    errors.add(:shift_already_active, :acitve, "Shift is already active") if active?
  end

end
