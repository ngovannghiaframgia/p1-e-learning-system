module Admin::ExercisesHelper
  def select_option_exercises subject_id
    @exercises = Exercise.by_subject_id subject_id
    @list_exercises = {}
    @exercises.each do |exercise|
      @list_exercises[exercise.question.to_s] = exercise.id
    end
  end
end
