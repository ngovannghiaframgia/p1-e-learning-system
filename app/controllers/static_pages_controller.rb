class StaticPagesController < ActionController::Base
  def login
    render layout: "login"
  end
end
