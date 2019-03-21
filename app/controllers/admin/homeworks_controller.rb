class Admin::HomeworksController < Admin::AdminBaseController
  include Admin::ExercisesHelper
  before_action :load_homework
  def show
    select_option_exercises @lesson.course.subject.id
    return if (@homework)
    @homework = Homework.new lesson_id: @lesson.id
    @homework.save!
  end

  def update
    homework = params.require(:homework).permit :name_homework, :lesson_number
    if @homework.update homework
      flash[:success] = t "updated_success"
      redirect_to admin_course_lessons_path(@lesson.course)
    else
      flash[:danger] = t "update_failed"
      redirect_to admin_course_lessons_path(@lesson.course)
    end

  end

  private

  def load_homework
    @lesson = Lesson.find_by id: params[:id]
    @homework = Homework.find_by lesson_id: params[:id]
    return unless (@homework)
    @list_homework_details = HomeworksDetail.by_homework_id @homework.id
  end
end
