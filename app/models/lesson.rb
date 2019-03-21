class Lesson < ApplicationRecord
  has_many :lesson_videos, dependent: :destroy
  accepts_nested_attributes_for :lesson_videos
  has_many :homeworks, dependent: :destroy
  has_many :comment_lessons, dependent: :destroy

  belongs_to :course

  validates :title, presence: true

  scope :order_desc, -> {order created_at: :desc}
  scope :by_course_id, -> (course_id){ where course_id: course_id}
end
