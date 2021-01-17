class TagsController < ApplicationController
  def index
    @tags = Article.tag_counts.most_used.map(&:name)
    #render json: { tags: Article.tag_counts.most_used.map(&:name) }
  end
end
