require "rails_helper"

RSpec.describe Lesson, type: :model do
  context "Course should have many Lesson" do
    it {is_expected.to belong_to :course}
  end
end
