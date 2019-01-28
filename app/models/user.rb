class User < ApplicationRecord
  has_many :course_user, dependent: :destroy
  has_many :Course, dependent: :destroy
  has_many :video, dependent: :destroy
  has_many :homework_result, dependent: :destroy
  
  belongs_to :role
end
