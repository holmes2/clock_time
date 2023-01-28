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
require "test_helper"

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
