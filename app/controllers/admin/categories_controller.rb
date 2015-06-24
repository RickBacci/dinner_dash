class Admin::CategoriesController < Admin::BaseController
  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @categories = Category.all
  end

  def update
    Item.find(params[:id]).update(retire: true)
    redirect_to category_path(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
    @category_items = @category.items
  end
end
