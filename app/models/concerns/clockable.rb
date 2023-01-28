module Clockable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :start_time
    validate :end_time_gt_start_time
    validates :active, inclusion: [true, false]
    validate :end_time_presence
  end

  def clock_start_time!
    return false if self.end_time.present?

    self.start_time = Time.now.utc
    self.active = true
    save!
  end

  def clock_end_time
    return false if self.end_time.present?

    self.end_time = Time.now.utc
    self.active = false
    save!
  end

  private

  def end_time_gt_start_time
    return if self.end_time.blank? || self.start_time.blank?
    return if self.start_time <= self.end_time
    errors.add(:base, :end_time, message: "End time cannot be in the past in relation to start time")
  end

  def end_time_presence
    return if active
    errors.add(:base, :end_time_not_present, message: 'End time should be present') if end_time.blank?
  end

end
