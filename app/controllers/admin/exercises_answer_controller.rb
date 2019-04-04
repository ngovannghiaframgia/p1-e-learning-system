class Admin::ExercisesAnswerController < Admin::AdminBaseController
  before_action :list_permissions, only: %i(new edit show index)
  before_action :load_exercises_answer, only: %i(edit show update destroy)
  before_action :select_option_subjects, only: %i(new edit)

  def index
  end

  def new
    @exercises_answer = ExercisesAnswer.new
  end

  def create
    @exercises_answer = ExercisesAnswer.new exercise_answer_params
    @exercises_answer.answer_true!
    if @exercises_answer.save
      flash[:success] = t "create_success"
      redirect_to  admin_exercises_path
    else
      flash[:danger] = t "update_failed"
      redirect_to  new_admin_exercise_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @exercises_answer.update exercise_answer_params
      flash[:success] = t "updated_success"
      redirect_to admin_exercises_path
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @exercises_answer.destroy
      flash[:success] = t "deleted_success"
    else
      flash[:danger] = t "deleted_failed"
    end
    redirect_to admin_exercises_path
  end

  private

  def exercise_answer_params
    params.require(:exercise).permit :content, :is_current
  end

  def load_exercises_answer
    @exercises_answer = Exercise.find_by id: params[:id]
    return if (@exercises_answer)
    flash[:danger] = t "not_found"
    render :index
  end
end
