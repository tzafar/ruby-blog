class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category create successfully"
      redirect_to @category
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category update successfully"
      redirect_to categories_url
    else
      render :edit
    end

  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

  private

  def require_admin
    if !(logged_in? && current_user.isAdmin)
      flash[:alert] = "You dont have permission to do it"
      redirect_to categories_url
    end
  end

  private
end
