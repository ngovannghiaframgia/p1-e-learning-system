class HomeworkResult < ApplicationRecord
  belongs_to :user
  belongs_to :homework
  belongs_to :exercises_answer
  belongs_to :homeworks_detail

  scope :by_user_homework, -> (user_id, homework_id){
    where("user_id = ? AND homework_id = ? ", user_id, homework_id ) }
end
