class UserMailer < ApplicationMailer
  def article_created(article)
    @article = article
    @user = article.user
    mail to: @user.email, subject: 'Article created'
  end
end
