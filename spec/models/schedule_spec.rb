require 'rails_helper'

describe Schedule do
  let(:user) { build(:user) }

  it 'validadetes date params on creation' do
    init = DateTime.now.beginning_of_week + 1.hour
    finish = init + 1.hour

    schedule = Schedule.new(user: user, init: init, finish: finish)
    expect(schedule).to be_valid()

    schedule.finish = init - 1.hour
    expect(schedule).to_not be_valid()

    schedule.init = init - 2.hour
    expect(schedule).to_not be_valid()

    schedule.init = init
    schedule.finish = DateTime.now.end_of_week + 1.hour
    expect(schedule).to_not be_valid()
  end
end