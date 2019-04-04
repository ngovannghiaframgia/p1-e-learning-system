class User < ApplicationRecord
  enum role: {student: 0, admin: 1, supperadmin: 2}
  devise :database_authenticatable, :encryptable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :lockable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :course_users, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :homework_results, dependent: :destroy

  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.min_password}, allow_nil: true

  scope :order_asc, -> {order id: :asc }
  scope :by_role, -> (role){ where role: role }

  def current_user? user
    self == user
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by email: data["email"]

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(fullname: data["name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end

  private

  def downcase_email
    email.downcase!
  end

end
