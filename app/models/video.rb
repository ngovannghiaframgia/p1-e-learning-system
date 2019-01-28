class Video < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :lesson_videos, foreign_key: :lesson_id, dependent: :destroy
end
