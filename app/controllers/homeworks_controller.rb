class HomeworksController < ApplicationController
  before_action :list_permissions, :load_homework

  def show
    if @homework
      @list_homework_details = HomeworksDetail.by_homework_id @homework.id
      @list_homework_result = HomeworkResult.by_user_homework current_user.id, @homework.id
    else
      @list_homework_details = []
      @list_homework_result = []
    end
  end

  private

  def load_homework
    @lesson = Lesson.find_by id: params[:id]
    @homework = Homework.find_by lesson_id: params[:id]
    return unless (@homework)
    @total_homework_result = TotalHomeworkResult.find_by user_id: current_user.id,
      homework_id: @homework.id
  end

end
