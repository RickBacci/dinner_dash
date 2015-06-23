class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
    redirect_to items_path
  end

  def update
    Item.find(params[:id]).update(retire: true)
    redirect_to items_path
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to categories_path
  end
end