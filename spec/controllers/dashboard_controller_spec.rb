require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context "#index" do
    before { create_login }
    it "responds successfully" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  private

  def create_login
    @user_one = FactoryBot.create :user
    sign_in @user_one
  end
end
