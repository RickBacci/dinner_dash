class OrdersController < ApplicationController

  def create
    @order = current_user.orders.new
    @order.add_order_items(@cart)

    if @order.save
      session[:cart] = {}
      redirect_to items_path
    else
      flash.now[:errors] = @order.errors.full_messages.join(", ")
      redirect_to cart_path
    end
   #  if current_user
   #    order_items = @cart.contents.each do |item_id, quantity|
   #      OrderItem.create(item_id: item_id, quantity: quantity)
   #    end
   #    @order = Order.create(order_items)
   #    redirect_to categories_path
   #  else
   #    redirect_to login_path
   #  end
  end

  def index
    if current_user && current_user.orders.count != 0
      @orders = current_user.orders
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
end
