FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
  end

  factory :schedule do
    user
    init { Week.init + 6.hours }
  end
end