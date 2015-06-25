class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item created!"
      redirect_to @item
    else
      flash[:notice] = "Item creation failed!"
      render new_admin_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.save
      flash[:notice] = "Item updated!"
      redirect_to admin_items_path
    else
      flash[:notice] = "Unable to update item"
      render '/admin/items/new'
    end
  end

  def retire
  #def retire_item
    Item.find(params[:id]).update(retire: true)
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :retire,
                                 category_ids: [])

  end
end
