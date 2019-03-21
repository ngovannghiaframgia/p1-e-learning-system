class Admin::VideosController < Admin::AdminBaseController
  include Admin::VideosHelper, Admin::SubjectsHelper
  before_action :load_course, only: %i(edit show update destroy)
  before_action :admin_user
  before_action :select_option_subjects, except: %i(index show destroy)

  def index
    @videos = Video.order_desc.page(params[:page]).per Settings.video.page
  end

  def new
    @video = Video.new
  end

  def create
    video_params[:link] = format_link_video video_params[:link]
    @video = Video.new video_params
    @video.user_id = current_user.id
    if @video.save
      flash[:success] = t "create_success"
      redirect_to admin_videos_path
    else
      flash[:danger] = t "create_failed"
      list_permissions
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    video_params[:link] = format_link_video video_params[:link]
    if @video.update video_params
      flash[:success] = t "updated_success"
      redirect_to admin_videos_path
    else
      flash[:danger] = t "update_failed"
      list_permissions
      render :edit
    end
  end

  def destroy
    if @video.destroy
      flash[:success] = t "deleted_success"
    else
      flash[:danger] = t "deleted_failed"
    end
    redirect_to admin_videos_path
  end

  private

  def video_params
    params.require(:video).permit :name_video, :link, :lesson_number, :description, :subject_id
  end

  def load_course
    @video = Video.find_by id: params[:id]
    return if (@video)
    flash[:danger] = t "not_found"
    redirect_to admin_videos_path
  end
end
