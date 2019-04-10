class Admin::CalculatesPointsController < Admin::AdminBaseController
  def create
    list_answer = params.require(:answer)
    reward_points = total_true = total_false = 0

    list_answer.each do |homeworks_detail, answer|
      homeworksdetail = HomeworksDetail.find_by id: homeworks_detail
      homework_result = HomeworkResult.new homeworks_detail_id: homeworks_detail,
        exercises_answer_id: answer, user_id: current_user.id,
        homework_id: homeworksdetail.homework_id
      homework_result.save!
      exercises_answer = ExercisesAnswer.find_by id: answer
      if exercises_answer.answer_true?
        total_true += 1
      else
        total_false += 1
      end
    end
    total_homework_result = TotalHomeworkResult.new user_id: current_user.id,
      homework_id: params.require(:homework_id), total_true: total_true,
      total_false: total_false, reward_points: reward_points
    total_homework_result.save!

    course_id = params.require(:lesson_id)
    redirect_to homework_path(course_id)
  end
end
