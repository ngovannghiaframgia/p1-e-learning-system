class SessionsController < ApplicationController
  layout "login"

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      if user.admin? || user.supperadmin?
        redirect_to admin_users_path
      else
        redirect_to users_path
      end
    else
      flash.now[:danger] = t ".invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
