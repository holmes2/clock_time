# == Schema Information
#
# Table name: breaks
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  active     :boolean
#  shift_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BreakTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
