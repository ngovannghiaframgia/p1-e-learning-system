require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    before { get :new }

    it "renders the login page" do
      expect(response).to render_template("sessions/new")
    end
    it { is_expected.to respond_with :success }
    it { is_expected.not_to set_flash }
  end

  describe "POST #create" do
    context "where authentication is valid" do
      it "creates a new session with a welcome message" do
        @user = FactoryBot.create(:user, id: 2)
        post :create, params: {session: { email: @user.email, password: @user.password }}
        allow(@user).to receive(:authenticate).and_return @user

        expect(session[:user_id]).to eq @user.id
      end
    end

    context "where password is invalid" do
      it "re-renders the signin page with an alert message" do
        user = FactoryBot.create(:user)
        post :create, params: {session: { email: user.email, password: "invalid" }}

        expect(response).to render_template :new
        expect(flash[:danger]).to match("Invalid email/password combination")
      end
    end
  end

  describe "DELETE #destroy" do
    it "should log the user out" do
      @user = FactoryBot.create(:user)
      delete :destroy
      expect(controller.current_user).to be_nil
      expect(controller).not_to be_signed_in
      expect(response).to redirect_to root_path
    end
  end
end
