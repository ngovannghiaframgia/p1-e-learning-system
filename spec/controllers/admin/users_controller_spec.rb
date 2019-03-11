require "rails_helper"
require "admin/users_controller"

RSpec.describe Admin::UsersController, type: :controller do
  before { create_login }

  context "#index" do
    it "responds successfully" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "#show" do
    it "responds successfully" do
      get :show, params: { id: @user_one.id }
      expect(response).to have_http_status(200)
    end
  end

  context "#delete" do
    it "delete the user" do
      user_one = FactoryBot.create :user
      expect {
        delete :destroy, params: { id: user_one.id }
      }.to change(User, :count).by(-1)
    end
  end

  private

  def create_login
    @user_one = FactoryBot.create( :user, role: 2 )
    log_in @user_one
  end
end
