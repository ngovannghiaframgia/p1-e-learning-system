require "rails_helper"

RSpec.describe UsersController, type: :controller do
  context "#index" do
    before { create_login }
    it "responds successfully" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "#show" do
    before { create_login }
    it "responds successfully" do
      get :show, params: { id: @user_one.id }
      expect(response).to have_http_status(200)
    end
  end

  context "#new" do
    it "responds successfully" do
      get :new
      expect(response).to have_http_status(200)
    end
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context "#create" do
    params = {
      fullname: "Nguyen Van A",
      email: "n@g.com",
      password: "123456"
    }
    it "creates user" do
      expect { post(:create, params: { user: params }) }.to change(User, :count).by(1)
      expect(flash[:success]).to be_present
    end
  end

  private
  def create_login
    @user_one = FactoryBot.create :user
    log_in @user_one
  end
end
