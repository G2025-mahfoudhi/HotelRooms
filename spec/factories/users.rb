FactoryBot.define do
  factory :user do
    first_name { "Marie" }
    last_name { "Dupont" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { "password123" }
  end
end
