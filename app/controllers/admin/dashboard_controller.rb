class Admin::DashboardController < Admin::BaseController
  def index
    @item = Item.new
  end
end
