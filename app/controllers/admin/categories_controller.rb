class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def update
    Item.find(params[:id]).update(retire: true)
    redirect_to admin_category_path(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  def show
    @category = Category.find(params[:id])
    @category_items = @category.items
  end
end
