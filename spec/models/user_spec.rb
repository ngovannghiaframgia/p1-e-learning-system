require "rails_helper"

RSpec.describe User, type: :model do
  context "#Relationships" do
    it { is_expected.to have_many :videos }
    it { is_expected.to have_many :courses }
    it { is_expected.to have_many :course_users }
    it { is_expected.to have_many :homework_results }
  end

  context "#scope" do
    let!(:user_one) { create :user, role: 0 }
    let!(:user_two) { create :user, role: 1 }
    it { expect(User.order_asc) == [ user_one, user_two ] }
    it { expect(@users = User.order_asc.by_role(:student)) == [ user_one ] }
  end

  context "#Validates" do
    let!(:user) { create :user }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_length_of(:email).is_at_most Settings.user.max_email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    describe "email with invalid format is invalid " do
      it { is_expected.to allow_value("email@addresse.com").for(:email) }
      it { is_expected.not_to allow_value("foo").for(:email) }
    end
    it { is_expected.to validate_presence_of :fullname }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least Settings.user.min_password }
  end

  context "#have attributes" do
    it "have attributes " do
      expect(User.new.attributes.keys).to include("id", "email", "fullname", "birth",
        "gender", "address", "numberphone", "role", "avt", "active",
        "password_digest", "created_at", "updated_at")
    end
  end

  context "#Enum" do
    it { is_expected.to define_enum_for(:role).with %i(student admin supperadmin) }
  end
end
