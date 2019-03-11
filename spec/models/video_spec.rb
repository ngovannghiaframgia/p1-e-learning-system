require "rails_helper"

RSpec.describe Video, type: :model do
  context "#Relationships" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :subject }
    it { is_expected.to have_many :lesson_videos }
  end
end
