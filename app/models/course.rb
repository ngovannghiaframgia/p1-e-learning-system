class Course < ApplicationRecord
  has_many :course_user, dependent: :destroy
  has_many :lesson, dependent: :destroy

  belongs_to :user
  belongs_to :subject

  scope :desc, -> {order course_name: :desc}
end
