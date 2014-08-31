FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
  end

  factory :schedule do
    user
    init { DateTime.now.beginning_of_week }
  end
end