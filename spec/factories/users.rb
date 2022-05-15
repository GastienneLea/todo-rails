FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5) }
    after :create do |user|
      create_list :task, rand(20), user: user
    end
  end
end
