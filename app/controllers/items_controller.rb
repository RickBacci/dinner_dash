class ItemsController < ApplicationController
  def index
    @items = Item.where(retire: false)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :picture)
  end
end
