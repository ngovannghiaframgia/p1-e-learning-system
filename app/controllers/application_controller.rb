class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  include SessionsHelper

  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "users.please_log_in"
      redirect_to login_url
    end
  end
end
