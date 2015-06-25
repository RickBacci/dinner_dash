class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @user = @order.user
  end

  def edit
    @order = Order.find(params[:id])
    if @order.update_status valid_params
      redirect_to admin_dashboard_path
    else
      redirect_to admin_dashboard_path, alert: 'Order status updated'
    end
  end

  private

  def valid_params
    params.require(:order).permit(:status)
  end
end
