require "rails_helper"
require "spec_helper"
RSpec.describe User, type: :model do

  context "associations" do
    it {is_expected.to have_many(:course).dependent(:destroy)}
    it {is_expected.to have_many(:course_user).dependent(:destroy)}
    it "permistion role" do
      expect(define_enum_for :role)
    end
  end

  context "valid user" do
    it { is_expected.to validate_presence_of(:fullname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context "scopes" do
    it "should return user in the correct order" do
      Course.order(:id).order_values
    end
  end
end
