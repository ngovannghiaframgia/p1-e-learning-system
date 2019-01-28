class User < ApplicationRecord
  has_many :course_user, dependent: :destroy
  has_many :Course, dependent: :destroy
  has_many :video, dependent: :destroy
  has_many :homework_result, dependent: :destroy

  belongs_to :role

  before_save :downcase_email

  validates :fullname, presence: true, length: {maximum: Settings.user.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.user.min_password}, allow_nil: true

  scope :order_asc, -> {order id: :asc }

  def current_user? user
    self == user
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
