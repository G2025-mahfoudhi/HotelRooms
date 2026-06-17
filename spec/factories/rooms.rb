FactoryBot.define do
  factory :room do
    room_type { "Chambre Double" }
    price { 75 }
    association :hotel
  end
end
