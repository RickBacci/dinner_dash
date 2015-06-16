class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id].to_i)
    redirect_to items_path, notice: "Added #{item.title} to cart"
  end
end