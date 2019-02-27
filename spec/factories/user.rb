FactoryBot.define do
  factory :user do
    fullname { Faker::Name.name  }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
