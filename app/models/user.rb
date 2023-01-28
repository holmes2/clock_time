# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :shifts
  has_many :breaks, through: :shifts

  def active_shifts?
    shifts.where(active: TRUE).length > 0
  end
end
