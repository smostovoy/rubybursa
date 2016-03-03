class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # PUT /articles/1
  def update
    article = Article.find(params[:id])
    article.update(params)
    redirect_to article_path(article)
  end

  # POST /articles
  def create
    article = Article.create(article_params)
    redirect_to article_path(article)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
