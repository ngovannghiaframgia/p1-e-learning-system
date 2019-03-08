class CoursesController < ApplicationController

  def index
    @courses = Course.order_by.page(params[:page]).per Settings.courses.page
  end
end
