require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "GET #index" do
    it "displays all Courses" do
      get :index
      expect(response).to be_redirect
    end
  end

  describe "GET #new" do
    it "assigns a new course to @course" do
      get :new
      expect(response).to be_redirect
    end
  end

  describe "POST #create" do
    subject(:course) { Course.new }
    it "is a new course" do
      expect(course).to be_a(Course)
    end
  end

end
