class LessonsController < ApplicationController
  include LessonsHelper
  before_action :list_permissions
  before_action :load_lessons, only: :show

  load_and_authorize_resource

  def show
    str = @lessons.lesson_videos[0].video.link
    @lessons.lesson_videos[0].video.link = link_standard_youtube str
  end

  private

  def load_lessons
    @lessons = Lesson.find_by id: params[:id]
    return if (@lessons)
    flash[:danger] = t "not_found"
    redirect_to admin_course_lessons_path
  end
end
