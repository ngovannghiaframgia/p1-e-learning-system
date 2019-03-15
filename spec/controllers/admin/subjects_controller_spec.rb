require "rails_helper"
require "admin/subjects_controller"

RSpec.describe Admin::SubjectsController, type: :controller do
  before { create_login }

  context "#index" do
    it "responds successfully" do
      total = Subject.order_asc.size
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:subjects).size).to eq total
    end
  end

  context "#new" do
    it "responds successfully" do
      get :new
      expect(response).to have_http_status(200)
    end
    it "assigns a new subject to @Subject" do
      get :new
      expect(assigns(:subject)).to be_a_new(Subject)
    end
  end

  context "#create" do
    params = {
      name_subject: "PHP",
      description: "Ngon Ngu Lap Trinh PHP"
    }
    it "creates subject" do
      expect { post(:create, params: { subject: params }) }.to change(Subject, :count).by(1)
      expect(flash[:success]).to be_present
    end
  end

  context "#delete" do
    it "delete the subject" do
      subject_one = FactoryBot.create :subject
      expect {
        delete :destroy, params: { id: subject_one.id }
      }.to change(Subject, :count).by(-1)
    end
  end

  private

  def create_login
    @user_one = FactoryBot.create( :user, role: 2 )
    log_in @user_one
  end
end
