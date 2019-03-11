FactoryBot.define do
  factory :permission do
    name_permission { Faker::Lorem.word }
    path { Faker::Lorem.word }
    role_id { Faker::Number.between(0, 2) }
    icon { Faker::Lorem.word }
  end
end
