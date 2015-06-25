class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category Created!"
      redirect_to admin_categories_path
    else
      flash[:notice] = "Category creation failed"
      render :new
    end
  end
  # def update
  #   Item.find(params[:id]).update(retire: true)
  #   redirect_to admin_category_path(params[:id])
  # end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
