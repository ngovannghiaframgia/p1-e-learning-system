class Homework < ApplicationRecord
  has_many :homeworks_details, dependent: :destroy

  belongs_to :lesson
end
