class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category create successfully"
      redirect_to @category
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update

  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title)
  end
end
