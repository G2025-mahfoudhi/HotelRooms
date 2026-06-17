FactoryBot.define do
  factory :hotel do
    name { "Hôtel Test" }
    city { "Paris" }
    description { "Un hôtel de test" }
    price { 50 }
    photo_url { "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800" }
  end
end
