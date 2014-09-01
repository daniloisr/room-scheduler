require 'rails_helper'

describe ScheduleBuilder do
  let(:sunday) { DateTime.new(2014, 8, 31) }
  let(:monday_6am) { DateTime.new(2014, 9, 1, 6) }

  it 'creates a right schedule based on weekday and hour' do
    allow(DateTime).to receive_messages(now: sunday)
    user = build(:user)
    schedule = ScheduleBuilder.build(user, 1, 6)

    expect(schedule.init <=> monday_6am).to be(0)
  end
end