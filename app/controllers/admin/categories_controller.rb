class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  def show
    @category = Category.find(params[:id])
  end
end
