class Exercise < ApplicationRecord
  has_many :homeworks_details, dependent: :destroy
  has_many :exercises_answer, dependent: :destroy
  
  belongs_to :subject
end
