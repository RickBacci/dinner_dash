class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to :back
  end

  def show
    @items = CartPresenter.new(@cart).items
  end

  def update
    @cart.update_item(params[:item_id], params[:quantity])
    flash[:notice] = 'Item quantity updated'
    redirect_to cart_path
  end

  # def destroy
  #   session[:cart] = {}
  #   redirect_to :back
  # end

  def destroy
    @cart.remove_item(params[:item_id])
    flash[:alert] = 'Item removed from cart'
    redirect_to cart_path
  end
end
