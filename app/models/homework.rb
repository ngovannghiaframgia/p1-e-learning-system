class Homework < ApplicationRecord
  has_many :homeworks_details, dependent: :destroy
  has_many :total_homework_result, dependent: :destroy

  belongs_to :lesson

  scope :order_asc, -> {order created_at: :asc }
  scope :by_role, -> (role){ where role: role }
end
