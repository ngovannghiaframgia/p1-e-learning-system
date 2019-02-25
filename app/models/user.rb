class User < ApplicationRecord
  enum role: %i(student admin supperadmin)
  has_many :course_user, dependent: :destroy
  has_many :course, dependent: :destroy
  has_many :video, dependent: :destroy
  has_many :homework_result, dependent: :destroy

  before_save :downcase_email

  validates :fullname, presence: true, length: {maximum: Settings.user.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.user.min_password}, allow_nil: true

  scope :order_asc, -> {order id: :asc }
  scope :by_role, -> (role){ where role: role }

  def current_user? user
    self == user
  end

  private

  def downcase_email
    email.downcase!
  end
end
