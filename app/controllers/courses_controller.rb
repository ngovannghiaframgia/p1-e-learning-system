class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :list_permissions, only: %i(new edit show index)
  before_action :load_user, only: :show

  def index
    @courses = Course.list_unregistered_courses(current_user).order_by
      .page(params[:page]).per Settings.courses.page
  end

  def show
    subject = Subject.find_subject(@course.subject_id)
    hash_course = { course: @course, subject: subject }
    render json: hash_course.to_json
  end

  private

  def load_user
    @course = Course.find_by id: params[:id]
  end
end
