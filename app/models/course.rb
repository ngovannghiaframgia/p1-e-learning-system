class Course < ApplicationRecord
  has_many :course_user, dependent: :destroy
  has_many :lesson, dependent: :destroy

  belongs_to :user
  belongs_to :subject

  scope :order_desc, -> {order course_name: :desc}
  scope :order_asc, -> {order id: :asc }
end
