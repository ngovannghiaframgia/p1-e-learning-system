require "rails_helper"

RSpec.describe Subject, type: :model do
  context "#Relationships" do
    it { is_expected.to have_many :courses }
    it { is_expected.to have_many :videos }
    it { is_expected.to have_many :exercises }
  end

  context "#Validates" do
    let!(:subject) { create :subject }
    it { is_expected.to validate_presence_of :name_subject }
    it { is_expected.to validate_length_of(:name_subject).is_at_most Settings.subject.max_name }
  end

  context "#scope" do
    let!(:subject_one) { create :subject }
    let!(:subject_two) { create :subject }
    it { expect(Subject.order_asc) == [ subject_one, subject_two ] }
  end
end
