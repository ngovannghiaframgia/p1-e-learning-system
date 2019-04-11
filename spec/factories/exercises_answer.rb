require 'faker'
require 'factory_bot_rails'

FactoryBot.define do
  factory :exercises_answer do
    content { Faker::Book.publisher }
  end
end
