class CoursesController < ApplicationController

  def index
    @courses = Course.order_desc.page(params[:page]).per Settings.courses.page
  end
end
