class OrdersController < ApplicationController
  def create
    if current_user
      @order = current_user.orders.create
      @cart.contents.each { |item| @order.order_items.create(item_id: item[0], quantity: item[1]) }
      session[:cart] = {}
      redirect_to categories_path
    else
      redirect_to login_path
    end
  end

  def index
    @orders = current_user.orders
  end
end
