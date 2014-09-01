class Week
  def initialize(datetime)
    @datetime = datetime
  end

  # Default beginning of week is set to monday
  def init
    @init ||=
      Week.to_a_valid_week(@datetime).beginning_of_week
  end

  # Finish of week is set to friday (sunday - 1.day)
  def finish
    @finish ||=
      Week.to_a_valid_week(@datetime).end_of_week - 1.day
  end

  class << self
    # Changes datetime to a valid week
    # saturday or sunday => monday
    def to_a_valid_week(datetime)
      case datetime.wday
      when 0 then datetime + 1.days
      when 6 then datetime + 2.days
      else datetime
      end
    end

    def current
      Week.new(Week.to_a_valid_week(DateTime.now))
    end

    # Defaults init of week is the current week
    def init
      self.current.init
    end

    # Defaults finish of week is the current week
    def finish
      self.current.finish
    end

    # begin of week is at monday, wday is from 1 to 5, so
    # we need to subtract 1 day to get the right day
    # example:
    #   3(wday) = wednesday
    #   Week.init = monday
    #   Week.init + 3.days = thursday
    #   thursday - 1.day = wednesday
    def at(wday)
      Week.init + wday.to_i.days - 1.day
    end

    def available_days
      (1..5).to_a
    end

    def available_hours
      (6...23).to_a
    end
  end
end