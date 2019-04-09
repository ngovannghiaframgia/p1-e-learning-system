FactoryBot.define do
  factory :video do
    name_video { Faker::Name.name  }
    description {Faker::Lorem.paragraph }
    link { Faker::Lorem.paragraph }
    lesson_number { Faker::Number.number(2) }

    after(:build) do |video|
      subject = FactoryBot.create :subject
      user = FactoryBot.create :user

      video.subject_id = subject.id
      video.user_id = user.id
    end
  end
end
