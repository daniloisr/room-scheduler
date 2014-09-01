require 'rails_helper'

describe Schedule do
  let(:user) { build(:user) }

  it 'validadetes date params on creation' do
    init = Week.init
    finish = init + 1.hour

    schedule = Schedule.new(user: user, init: init, finish: finish)
    expect(schedule).to be_valid()

    schedule.finish = init - 1.hour
    expect(schedule).to_not be_valid()

    schedule.init = init - 2.hour
    expect(schedule).to_not be_valid()

    schedule.init = init
    schedule.finish = Week.finish + 1.hour
    expect(schedule).to_not be_valid()
  end

  it 'validates already taken schedule' do
    schedule = create(:schedule)
    schedule2 = schedule.dup

    expect(schedule2).to_not be_valid()
    expect(schedule2.errors.full_messages.first).to eq('Já existe uma reserva para esse horário')
  end

  it 'scope by day' do
    begin_week = Week.init
    s1 = create(:schedule, init: begin_week)
    s2 = create(:schedule, init: begin_week + 1.day)

    expect(Schedule.by_day(begin_week)).to include(s1)
    expect(Schedule.by_day(begin_week)).to_not include(s2)
  end

  it 'scopes by week' do
    begin_week = Week.init
    s1 = create(:schedule, init: begin_week)
    # creates s2 in another week, so we need to bypass validation
    s2 = build(:schedule, init: begin_week + 8.day)
    s2.save(validate: false)

    expect(Schedule.by_week(begin_week)).to include(s1)
    expect(Schedule.by_week(begin_week)).to_not include(s2)
  end
end
