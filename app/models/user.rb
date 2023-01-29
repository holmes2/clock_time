# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :string
#
class User < ApplicationRecord
  has_many :shifts

  def start_shift
    return if active_shifts?

    shift = Shift.new
    self.shifts << shift
    shift.clock_start_time!
    save!
  end

  def end_shift
    return if active_shift.blank?

    active_shift.clock_end_time
  end

  

  def active_shifts?
    shifts.where(active: true, user_id: self.id).length > 0
  end

  def start_lunch_break
    return if active_shift.blank?
    return if active_shift.lunch_break.present?

    lunch_break = LunchBreak.new
    lunch_break.shift = active_shift
    lunch_break.clock_start_time!
    save!
  end

  def end_lunch_break
    return if active_lunch_break.blank?

    active_lunch_break.clock_end_time
  end

  def start_break
    return if active_shift.blank?

    normal_break = NormalBreak.new
    active_shift.normal_breaks << normal_break
    normal_break.clock_start_time!
    save!
  end

  def end_break
    active_break.clock_end_time
  end

  def active_break
    return if active_shift.blank?

    active_shift.active_break
  end

  def active_lunch_break
    return if active_shift.blank?
    return if active_shift.lunch_break.blank?

    return active_shift.lunch_break if active_shift.lunch_break.active
  end

  def active_shift
    shifts.where(active: true).first
  end
end
