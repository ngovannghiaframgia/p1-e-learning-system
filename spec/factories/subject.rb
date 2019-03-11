FactoryBot.define do
  factory :subject do
    name_subject { Faker::Book.publisher }
    description { Faker::Book.publisher }
  end
end
