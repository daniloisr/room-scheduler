require 'rails_helper'

describe Week do
  let(:sunday) { DateTime.new(2014, 8, 31) }
  let(:saturday) { DateTime.new(2014, 8, 30) }
  let(:monday) { DateTime.new(2014, 9, 1) }

  it 'calculates the current week' do
    datetime = Week.to_a_valid_week(sunday)
    expect(datetime <=> monday).to be(0)

    datetime = Week.to_a_valid_week(sunday)
    expect(datetime <=> monday).to be(0)
  end

  it 'creates the current week' do
    allow(DateTime).to receive_messages(now: sunday)
    expect(Week.current.init <=> monday).to be(0)
  end

  it 'get datetime to a certain weekday' do
    allow(DateTime).to receive_messages(now: sunday)

    wednesday = Week.at(3)
    expect(sunday + 3.days <=> wednesday).to be(0)
  end
end