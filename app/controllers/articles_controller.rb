class ArticlesController < ApplicationController
  before_action :require_user, except: [:show, :index]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
  end

  def update
    updated_article = params.require(:article).permit(:title, :body)
    @article = Article.find(params[:id])
    if @article.update(updated_article)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
end