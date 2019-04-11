require 'faker'
require 'factory_bot_rails'

FactoryBot.define do
  factory :exercise do
    question { Faker::Book.publisher }

    after(:build) do |exercise|
      subject = FactoryBot.create :subject
      exercises_answer = FactoryBot.create :exercises_answer

      exercise.subject_id = subject.id
      exercise.exercises_answer_id = exercises_answer.id
    end
  end
end
