require 'faker'
require 'factory_bot_rails'

FactoryBot.define do
  factory :course do
    course_name { Faker::Name.name }
    quantity_registered { Faker::Number.decimal_part(10) }
    created_at { Faker::Time.between(1.days.ago, Date.today, :all) }

    after(:build) do |course|
      subject = FactoryBot.create :subject
      user = FactoryBot.create :user

      course.subject_id = subject.id
      course.user_id = user.id
    end
  end
end
