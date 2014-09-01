class ScheduleBuilder
  # Creates a Schedule using the current weekday and hour
  def self.build(user, wday, hours)
    inti = Week.at(wday) + hours.to_i.hours
    Schedule.new(user: user, init: inti)
  end
end