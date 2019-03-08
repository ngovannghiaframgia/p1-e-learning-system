require "rails_helper"

RSpec.describe CourseUser, type: :model do
  context "Course should have many Course user" do
    it {is_expected.to belong_to :course}
    it {is_expected.to belong_to :user}
  end
end
