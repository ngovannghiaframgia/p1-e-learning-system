class Subject < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :exercises

  validates :name_subject, presence: true, length: {maximum: Settings.subject.max_name}

  scope :order_asc, -> {order id: :asc }
  scope :find_subject, -> (subject_id){ where id: subject_id }
end
