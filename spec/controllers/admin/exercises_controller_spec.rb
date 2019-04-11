require "rails_helper"
require "admin/exercises_controller"

RSpec.describe Admin::ExercisesController, type: :controller do
  before { create_login }

  context "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_redirect
    end
  end

  context "GET #new" do
    it "responds successfully" do
      get :new
      expect(response).to have_http_status(302)
    end
    it "assigns a new exercises to @exercise" do
      get :new
      expect(response).to be_redirect
    end
  end

  context "POST #create" do
    it "create a new valid exercises" do
      params = FactoryBot.attributes_for(:exercise)
      expect {post :create, exercise: params}.to change(Exercise, :count).by(1)
      should redirect_to(action: :index)
    end
    it "exercises with an invalid" do
      invalid_params = FactoryBot.attributes_for(:exercise)
      expect { post :create, exercise: invalid_params }.to_not change(Exercise, :count)
    end
    subject(:exercises) { Exercise.new }
    it "is a new Exercise" do
      expect(exercises).to be_a(Exercise)
    end
  end

  private

  def create_login
    @user_one = FactoryBot.create( :user, role: 2 )
    log_in @user_one
  end
end
