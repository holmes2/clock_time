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

    def start_shift
    return if active_shifts?

    shift = Shift.new
    self.shifts << shift
    shift.clock_start_time!
    save!
  end

  def end_shift
    active_shift.clock_end_time
  end

  

  def active_shifts?
    shifts.where(active: TRUE).length > 0
  end

  def start_lunch_break
    lunch_break = LunchBreak.new
    active_shift.lunch_break = lunch_break
    lunch_break.clock_start_time!
    save!
  end

  def end_lunch_break
    active_shift.lunch_break.clock_end_time
  end

  def start_break
    normal_break = NormalBreak.new
    active_shift.breaks << normal_break
    normal_break.clock_start_time!
    save!
  end

  def end_break
    active_break.clock_end_time
  end

  def active_break
    active_shift.breaks.where(active: true).first
  end

  def active_shift
    shifts.where(active: true).first
  end
end
