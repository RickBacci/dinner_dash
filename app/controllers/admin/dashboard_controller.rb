class Admin::DashboardController < Admin::BaseController
  def index
    @item = Item.new
    @orders = Order.all
  end
end
