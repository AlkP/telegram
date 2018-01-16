FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    sequence(:username) { |n| "user#{n}" }
    email

    factory :admin do
      sequence(:username) { |n| "admin#{n}" }
      role 1
    end
  end
end
