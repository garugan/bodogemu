FactoryBot.define do
  factory :game do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
    association :genre
  end
end