FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5) }
  end
end
