class Course < ApplicationRecord
  has_many :course_user, dependent: :destroy
  has_many :lesson, dependent: :destroy

  belongs_to :user
  belongs_to :subject

  validates :course_name, presence: true, length: {maximum: Settings.courses.max_name}

  scope :order_by, -> {order created_at: :desc}
  scope :unregistered_courses, ->  (list_id_course){ where("id NOT IN (?)", list_id_course) }
  scope :by_subject_id, -> (subject_id){ where subject_id: subject_id }

  def self.list_unregistered_courses user_id
    list_id_course = CourseUser.course_of_user(user_id).map(&:course_id)
    if list_id_course == []
      list_id_course = [-1]
    end
    Course.unregistered_courses list_id_course
  end
end
