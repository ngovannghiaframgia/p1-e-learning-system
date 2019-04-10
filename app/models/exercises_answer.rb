class ExercisesAnswer < ApplicationRecord
  enum is_current: { answer_false: 0, answer_true: 1}

  belongs_to :exercise

end
