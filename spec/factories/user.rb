FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "テストユーザー#{n}" }
    email { Faker::Internet.unique.email }
    password { "password" }
    password_confirmation { "password" }
    introduction { Faker::Lorem.characters(number:10) }
  end
end