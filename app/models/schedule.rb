class Schedule < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :init, presence: true
  validates :finish, presence: true

  validate :valid_time, :exclusive_schedule

  # TODO: i18n errors messages
  def valid_time
    return if init.nil? || finish.nil?
    if init < Week.init || init > Week.finish
      errors.add(:init, "Deve ser no périodo desta semana")
    elsif finish < Week.init || finish > Week.finish
      errors.add(:finish, "Deve ser no périodo desta semana")
    elsif finish < init
      errors.add(:finish, "Deve ser maior que a data de início")
    end
  end

  # Verify if exists a schedule for the given interval
  def exclusive_schedule
    if Schedule.where('init >= ? AND init <= ?', init, finish).any?
      errors.add(:base, "Já existe uma reserva para esse horário")
    end
  end

  scope :by_day, ->(dtime) {
    where('? <= init AND finish <= ?', dtime.beginning_of_day, dtime.end_of_day)
  }

  scope :in_current_week, -> { by_week(DateTime.now) }

  scope :by_hour, ->(hour) {
    where("extract(hour from init) = ?", "%02d" % (hour - DateTime.now.zone.to_i))
  }

  scope :by_week, ->(dtime) {
    week = Week.new(dtime)
    where('? <= init AND finish <= ?', week.init, week.finish)
  }

  # sets finish time to (init time + 1 hour) if it's nil
  before_validation :set_finish_time

  def set_finish_time
    self.finish = init + 59.minutes if !init.nil? && finish.nil?
  end
end
