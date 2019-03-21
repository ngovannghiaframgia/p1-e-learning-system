class Admin::LessonsController < Admin::AdminBaseController
  before_action :load_lessons, only: %i(edit show update destroy)
  before_action :load_course, except: :get_video

  def index
    @lessons = Lesson.order_desc.by_course_id(params[:course_id])
      .page(params[:page]).per Settings.user.record_page
    @search = Lesson.search(params[:q])
    @lessons_q = @search.result(distinct: true)
  end

  def new
    @lessons = Lesson.new
    @lessons.lesson_videos << LessonVideo.new
    select_option_videos @course.subject_id
  end

  def create
    @lessons = Lesson.new lessons_params
    @lessons.user_id = current_user.id
    if @lessons.save
      flash[:success] = t "create_success"
      redirect_to  admin_course_lessons_path
    else
      select_option_videos @course.subject_id
      render :new
    end
  end

  def show
  end

  def edit
    select_option_videos @course.subject_id
  end

  def update
    if @lessons.update lessons_params
      flash[:success] = t "updated_success"
      redirect_to admin_course_lessons_path
    else
      select_option_videos @course.subject_id
      flash[:danger] = t "update_failed"
      render :edit
    end
  end


  def destroy
    if @lessons.destroy
      flash[:success] = t "deleted_success"
    else
      flash[:danger] = t "deleted_failed"
    end
    redirect_to admin_course_lessons_path
  end

  def get_video
    video = Video.find_by id: params[:video_id]
    respond_to do |format|
      format.json { render :json => video }
    end
  end

  def search
    index
    render :index
  end

  private

  def lessons_params
    params.require(:lesson).permit :title, :content, :course_id,
      lesson_videos_attributes: [:id, :video_id, :_destroy]
  end

  def select_option_videos subject_id
    @videos = [Video.new]
    @videos += Video.by_subject_id subject_id
    @list_videos = {}
    @list_videos[Video.new.name_video.to_s] = nil
    @videos.each do |video|
      @list_videos[video.name_video.to_s] = video.id
    end
  end

  def load_lessons
    @lessons = Lesson.find_by id: params[:id]
    return if (@lessons)
    flash[:danger] = t "not_found"
    redirect_to admin_course_lessons_path
  end

  def load_course
    @course = Course.find_by id: params[:course_id]
    return if (@course)
    flash[:danger] = t "not_found"
    render :index
  end
end
