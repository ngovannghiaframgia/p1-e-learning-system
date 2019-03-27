class CourseUser < ApplicationRecord
  belongs_to :user
  belongs_to :course

  scope :course_of_user, -> (user_id){ where user_id: user_id }
end
