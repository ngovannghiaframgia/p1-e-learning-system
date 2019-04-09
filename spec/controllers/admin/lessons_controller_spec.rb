require "rails_helper"

RSpec.describe Admin::LessonsController, type: :controller do
  before(:each) do
    create_login
    @course = FactoryBot.create( :course )
  end


  context "#index" do
    it "responds successfully" do
      @lesson1 = FactoryBot.create( :lesson, user_id: @user_one.id, course_id: @course.id )
      @lesson2 = FactoryBot.create( :lesson, user_id: @user_one.id, course_id: @course.id )
      total = Lesson.order_desc.by_course_id(@course.id).size
      get :index, params: { use_route: "/admin/courses/:course_id/lessons"  , course_id: @course.id }
      expect(response).to have_http_status(200)
      expect(assigns(:lessons).size).to eq total
    end
  end

  context "#new" do
    it "responds successfully" do
      get :new, params: { use_route: "/admin/courses/:course_id/lessons/new"  , course_id: @course.id }
      expect(response).to have_http_status(200)
    end
    it "assigns a new Lesson to @Lesson" do
      get :new, params: { use_route: "/admin/courses/:course_id/lessons/new"  , course_id: @course.id }
      expect(assigns(:lessons)).to be_a_new(Lesson)
    end
  end

  context "#create" do
    course = FactoryBot.create( :course )
    video = FactoryBot.create( :video )
    params = {
      title: "Lesson 01",
      course_id: course.id,
      content: "lien cho",
      lesson_videos_attributes: [
        id: nil,
        video_id: video.id
      ]
    }
    it "creates lesson" do
      expect {
        post :create, params: { lesson: params, use_route: "/admin/courses/#{course.id}/lessons",
          course_id: course.id }
      }.to change(Lesson, :count).by(1)
      expect(flash[:success]).to be_present
    end
  end

  context "#show" do
    course = FactoryBot.create( :course )
    lesson = FactoryBot.create( :lesson, course_id: course.id )
    it "responds successfully" do
      get :show, params: { use_route: "/admin/courses/:course_id/lessons/:id",
        course_id: course.id, id: lesson.id }
      expect(response).to have_http_status(200)
    end
  end


  describe "#edit" do
    course = FactoryBot.create( :course )
    lesson = FactoryBot.create( :lesson, course_id: course.id )
    it "responds successfully" do
      get :show, params: { use_route: "/admin/courses/:course_id/lessons/:id/edit",
        course_id: course.id, id: lesson.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "#update" do
    video = FactoryBot.create( :video )
    course = FactoryBot.create( :course )
    lesson = FactoryBot.create( :lesson, course_id: course.id )
    params = {
      title: "Lesson 02",
      content: "abc",
      lesson_videos_attributes: [
        id: nil,
        video_id: video.id
      ]
    }

    before(:each) do
      patch :update,  params: { lesson: params,
        use_route: "/admin/courses/:course_id/lessons/:id",
        course_id: course.id, id: lesson.id
      }
      lesson.reload
    end

    it { expect(lesson.title).to eql params[:title] }
    it { expect(lesson.content).to eql params[:content] }
  end

  context "#delete" do
    it "delete the lesson" do
      course = FactoryBot.create( :course )
      lesson = FactoryBot.create( :lesson, course_id: course.id )
      expect {
        delete :destroy, params: { use_route: "/admin/courses/:course_id/lessons/:id",
          id: lesson.id, course_id: course.id
        }
      }.to change(Lesson, :count).by(-1)
    end
  end

  def create_login
    @user_one = FactoryBot.create( :user, role: 2 )
    sign_in @user_one
  end
end
