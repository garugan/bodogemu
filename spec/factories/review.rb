FactoryBot.define do
  factory :review do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
    rating { 4.0 }
    playtime { 120 }
    player { 4 }
    association :user
    association :game
  end
end