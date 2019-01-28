require "rails_helper"

RSpec.describe Lesson, type: :model do
  context "#Relationships" do
    it { is_expected.to have_many :lesson_videos }
    it { is_expected.to have_many :homeworks }
    it { is_expected.to have_many :comment_lessons }
    it { is_expected.to belong_to :course }
  end
end
