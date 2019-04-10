class HomeworksDetail < ApplicationRecord
  belongs_to :exercise
  belongs_to :homework

  scope :by_homework_id, -> (homework_id){ where homework_id: homework_id }
end
