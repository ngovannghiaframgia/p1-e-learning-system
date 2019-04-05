class LessonsController < ApplicationController
  load_and_authorize_resource

  def index
    @lessons = Lesson.order_desc.page(params[:page]).per Settings.lessons.page
  end
end
