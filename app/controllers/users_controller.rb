class UsersController < ApplicationController
  layout "signup", only: %i(create new)

  before_action :load_user, only: %i(index show)
  before_action :logged_in_user, only: %i(index correct_user)
  before_action :correct_user, only: %i(index show)

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".sigup_success"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :fullname, :email, :password, :password_confirmation
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless ( !current_user.nil? && current_user.current_user?(@user) )
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "not_found"
    redirect_to login_path
  end
end
