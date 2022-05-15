FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    is_completed { Faker::Boolean.boolean(true_ratio: 0.2) }
    due_at { Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today) }
    details { Faker::Lorem.paragraph }
    user
  end
end
