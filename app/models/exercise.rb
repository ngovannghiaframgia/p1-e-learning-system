class Exercise < ApplicationRecord
  has_many :homeworks_details, dependent: :destroy
  has_many :exercises_answer, dependent: :destroy

  belongs_to :subject
  scope :order_by, -> {order created_at: :desc}

  accepts_nested_attributes_for :exercises_answer, allow_destroy: true
end
