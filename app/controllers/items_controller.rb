class ItemsController < ApplicationController
  def index
    @items = Item.where(retire: false)
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      flash[:notice] = "Item created!"
      redirect_to @item
    else
      flash[:notice] = "Item creation failed!"
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :picture, :category_list)
  end
end
