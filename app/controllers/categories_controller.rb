class CategoriesController < ApplicationController
  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

    if current_admin?
      @category_items = @category.items
    else
      @category_items = @category.items.where(retire: false)
    end
  end

  def update
    Item.find(params[:id]).update(retire: true)
    redirect_to category_path(params[:id])
  end
end
