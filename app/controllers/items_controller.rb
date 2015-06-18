class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.create(item_params)
   # @item = Item.create(params[:item])
    if @item.save
      flash[:notice] = "Item created!"
      redirect_to admin_dashboard_path
    else
      flash[:notice] = "Item creation failed!"
   #   redirect_to admin_dashboard_path
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo)
  end
end
