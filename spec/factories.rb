FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
  end

  factory :schedule do
    user
    init { Schedule.new.beginning_of_week + 6.hours }
  end
end