class UsersController < ApplicationController
  layout "signup", only: %i(create new)

  before_action :list_permissions, only: %i(edit show index)

  load_and_authorize_resource except: %i(new create)

  before_action :load_user, except: %i(new create)
  before_action :admin_user, only: %i(index show)
  before_action :correct_user, only: %i(show edit)

  def index
  end

  def show
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
