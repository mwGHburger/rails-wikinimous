class ArticlesController < ApplicationController
  # CREATE
  def new
    @new_article = Article.new
  end

  def create
    @new_article = Article.new(article_params)
    @new_article.save
    redirect_to articles_path
  end
  # READ
  # see all
  def index
    @articles = Article.all
  end
  # see one
  def show
    @article = Article.find(params[:id])
  end
  # UPDATE
  # 1. edit
  def edit
    @article = Article.find(params[:id])
  end
  # 2. update
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end
  # DELETE
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  # strong params
  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
