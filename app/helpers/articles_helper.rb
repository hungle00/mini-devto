module ArticlesHelper
  def assign_article_creator(article, creator)
    article.user = creator
    article
  end
end
