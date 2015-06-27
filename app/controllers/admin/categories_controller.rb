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
      flash[:notice] = 'Category Created!'
      redirect_to admin_categories_path
    else
      flash[:notice] = 'Category creation failed'
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    if @category.save
      flash[:notice] = 'Category successfully edited'
      redirect_to admin_category_path(params[:id])
    else
      flash[:notice] = 'Category un-successfully edited'
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Category successfully destroyed'
      redirect_to admin_categories_path
    else
      flash[:notice] = 'Category not destroyed'
      redirect_to admin_categories_path
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_items = @category.items.where(retire: false)
  end

  private

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
