class Video < ApplicationRecord
  belongs_to :subject
  has_many :lesson_video, dependent: :destroy

  belongs_to :user
end
