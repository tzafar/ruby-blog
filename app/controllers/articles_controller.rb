class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    article_params = params.require(:article).permit(:title, :body, :status)
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
  end

  def update
    updated_article = params.require(:article).permit(:title, :body)
    if @article.update(updated_article)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user && !current_user.isAdmin
      flash[:alert] = "You can only edit your own articles"
      redirect_to @article
    end
  end
end