class ArticlesController < ApplicationController
  # before_action :authorize_user

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
    @article.some_methods
  end

  # PUT /articles/1
  def update
    article = Article.find(params[:id])
    article.update(params)
    redirect_to article_path(article)
  end

  # POST /articles
  def create
    article = Article.create(article_params.merge({user: User.last}))
    UserMailer.article_created(article).deliver_later
    ArticleCheckerJob.perform_later
    Rails.logger.info 'After mailer'

    Pusher.trigger('main', 'article_created', 'PUSHER!')
    redirect_to article_path(article), notice: 'Article created!'
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice: 'Article deleted!'
  end

  private

  def article_params
    res = params.require(:article).permit(:title, :text)
    res
  end

end
