class Subject < ApplicationRecord
  has_many :course, dependent: :destroy
  has_many :video, dependent: :destroy
  has_many :exercise

  validates :name_subject, presence: true, length: {maximum: Settings.subject.max_name}

  scope :order_asc, -> {order id: :asc }
end
