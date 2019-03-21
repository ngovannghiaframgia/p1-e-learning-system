class Video < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :lesson_videos, dependent: :destroy

  validates :name_video, presence: true
  validates :link, presence: true
  validates :lesson_number, presence: true

  scope :order_asc, -> {order id: :asc }
end
