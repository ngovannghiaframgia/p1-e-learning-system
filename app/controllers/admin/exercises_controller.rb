class Admin::ExercisesController < Admin::AdminBaseController
  include Admin::SubjectsHelper
  before_action :list_permissions, only: %i(new edit show index)
  before_action :load_exercises, only: %i(edit show update destroy)
  before_action :select_option_subjects, only: %i(new edit)

  def index
    @exercises = Exercise.order_by.page(params[:page]).per Settings.user.record_page
  end

  def new
    @exercises = Exercise.new
    4.times do
      @exercises.exercises_answer << ExercisesAnswer.new
    end
  end

  def create
    @exercises = Exercise.new exercise_params
    if @exercises.save
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
    if @exercises.update exercise_params
      flash[:success] = t "updated_success"
      redirect_to admin_exercises_path
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @exercises.destroy
      flash[:success] = t "deleted_success"
    else
      flash[:danger] = t "deleted_failed"
    end
    redirect_to admin_exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit :subject_id, :question,
      exercises_answer_attributes: [:id, :content, :is_current, :_destroy]
  end

  def load_exercises
    @exercises = Exercise.find_by id: params[:id]
    return if (@exercises)
    flash[:danger] = t "not_found"
    render :index
  end
end
