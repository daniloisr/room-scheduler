class Schedule < ActiveRecord::Base
  belongs_to :user

  # sets finish time to (init time + 1 hour) if it's nil
  before_validation :set_finish_time

  validates :user, presence: true
  validates :init, presence: true
  validates :finish, presence: true

  validate :valid_time

  def valid_time
    return if init.nil? || finish.nil?
    if init < beginning_of_week || init > end_of_week
      errors.add(:init, "Deve ser no périodo desta semana")
    elsif finish < beginning_of_week || finish > end_of_week
      errors.add(:finish, "Deve ser no périodo desta semana")
    elsif finish < init
      errors.add(:finish, "Deve ser maior que a data de início")
    end
  end

  def end_of_week
    dtime = DateTime.now
    dtime += 2.days if [0, 6].include?(dtime.wday)
    dtime.end_of_week - 1.day
  end

  def beginning_of_week
    dtime = DateTime.now
    dtime += 2.days if [0, 6].include?(dtime.wday)
    dtime.beginning_of_week
  end

  def available_days
    (0...5).to_a
  end

  def available_hours
    (6...23).to_a
  end

  scope :by_day, ->(dtime) {
    where('? <= init AND finish <= ?', dtime.beginning_of_day, dtime.end_of_day)
  }

  scope :by_hour, ->(hour) {
    where("strftime('%H', init) = ?", "%02d" % hour)
  }

  scope :by_week, ->(dtime) {
    # if dtime if on saturday of sunday, move to monday
    dtime += 2.days if [0, 6].include?(dtime.wday)
    where('? <= init AND finish <= ?', dtime.beginning_of_week, dtime.end_of_week)
  }

  def set_finish_time
    self.finish = init + 1.hour if !init.nil? && finish.nil?
  end
end
