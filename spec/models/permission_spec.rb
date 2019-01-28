require "rails_helper"

RSpec.describe Permission, type: :model do
  context "#scope" do
    let!(:permission_one) { create :permission, role_id: 0 }
    let!(:permission_two) { create :permission, role_id: 1 }
    let!(:permission_three) { create :permission, role_id: 2 }
    it { expect(Permission.by_role_id(0)) == [ permission_one ] }
  end
end
