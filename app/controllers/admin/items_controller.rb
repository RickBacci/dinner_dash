class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
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

  def update
    Item.find(params[:id]).update(retire: true)
    redirect_to admin_items_path
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to categories_path
  def retire
   Item.find(params[:id]).update(retire: true)
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :picture, :category_list)
  end
end
