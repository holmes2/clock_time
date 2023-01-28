# == Schema Information
#
# Table name: breaks
#
#  id         :integer          not null, primary key
#  active     :boolean
#  end_time   :datetime
#  start_time :datetime
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
  belongs_to :shift
end
