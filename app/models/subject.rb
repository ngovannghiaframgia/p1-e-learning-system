class Subject < ApplicationRecord
  has_many :course, dependent: :destroy
  has_many :video, dependent: :destroy
  has_many :exercise
end
