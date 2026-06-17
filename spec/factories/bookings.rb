FactoryBot.define do
  factory :booking do
    start_date { Date.today + 1 }
    end_date { Date.today + 3 }
    total_price { 150 }
    association :user
    association :room
  end
end
