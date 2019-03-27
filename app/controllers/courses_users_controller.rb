class CoursesUsersController < ApplicationController
  def create
    @course_user = CourseUser.new
    @course_user.course_id = params[:format]
    @course_user.user_id = current_user.id
    course = Course.find_by id: params[:format]
    @course_user.debit = course.price
    if @course_user.save
      course.quantity_registered = course.quantity_registered + 1
      course.save
      flash[:success] = t "register_success"
    else
      flash[:danger] = t "register_failed"
    end
    redirect_to courses_path
  end
end
