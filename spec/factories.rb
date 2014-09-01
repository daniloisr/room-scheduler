FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:login) { |n| "login#{n}" }
    password "password"
  end

  factory :schedule do
    user
    init { Week.init + 6.hours }
  end
end