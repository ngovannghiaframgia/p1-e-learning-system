class UsersController < ApplicationController
  layout "signup", only: %i(create new)

  before_action :list_permissions, only: %i(edit show index)

  load_and_authorize_resource except: %i(new create update)

  before_action :load_user, except: %i(new create)
  before_action :admin_user, only: :index
  before_action :correct_user, only: %i(show edit)

  def index
  end

  def show
  end

  def update
    user = params.require(:user).permit :fullname, :birth, :gender, :address, :numberphone
    if @user.update user
      flash[:success] = t "updated_success"
      redirect_to dashboard_index_path
    else
      flash[:danger] = t "update_failed"
      render :show
    end
  end


  def new
    @user = User.new
  end

  private

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless ( !current_user.nil? && current_user.current_user?(@user) )
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if (@user || current_user)
    flash[:danger] = t "not_found"
    redirect_to login_path
  end

  def admin_user
    redirect_to admin_users_path current_user unless current_user.student?
  end
end
