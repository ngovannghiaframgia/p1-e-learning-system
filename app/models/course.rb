class Course < ApplicationRecord
  has_many :course_user, dependent: :destroy
  has_many :lesson, dependent: :destroy

  belongs_to :user
  belongs_to :subject

  validates :course_name, presence: true, length: {maximum: Settings.courses.max_name}
  validates :quantity_registered, presence: true, length: {minimum: Settings.courses.quantity}

  scope :order_by, -> {order created_at: :desc}
end
