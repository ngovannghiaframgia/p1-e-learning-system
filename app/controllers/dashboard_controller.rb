class DashboardController < ApplicationController
  before_action :list_permissions, only: %i(index)
  def index; end
end
