class ScheduleBuilder
  # Creates a Schedule using the current weekday and hour
  def self.build(user, wday, hours)
    init = Week.at(wday) + hours.to_i.hours
    Schedule.new(user: user, init: init)
  end
end