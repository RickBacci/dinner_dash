class CategoriesController < ApplicationController
  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_items = @category.items.where(retire: false)
  end
end
