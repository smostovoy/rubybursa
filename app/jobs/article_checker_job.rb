class ArticleCheckerJob < ActiveJob::Base
  queue_as :default

  def perform
    p '========= starting job'
    article = Article.first
    article.destroy!
    p '========= destroyed! id: ' + article.id.to_s
  end
end
