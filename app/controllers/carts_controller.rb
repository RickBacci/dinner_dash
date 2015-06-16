class CartsController < ApplicationController
  def create
    cart = session[:cart] || {}
    cart[params[:item_id]] ||= 0
    cart[params[:item_id]] += 1
    session[:cart] = cart
    
    item = Item.find(params[:item_id].to_i)
    redirect_to items_path, notice: "Added #{item.title} to cart"
  end
  
end