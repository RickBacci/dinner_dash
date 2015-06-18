class Admin::BaseController < ApplicationController
  private

  before_action :require_admin

  def require_admin
    current_admin?
  end
end
