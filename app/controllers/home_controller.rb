class HomeController < ApplicationController
  def index
    @articles = Article.all.includes(:user)

    @articles = @articles.authored_by(params[:author]) if params[:author].present?
    @articles = @articles.favorited_by(params[:favorited]) if params[:favorited].present?

    @articles = @articles.order(created_at: :desc)

    @articles = @articles.search(params[:search])

    @tags = Article.tag_counts.most_used.map(&:name)
  end

  def tagged
    if params[:tag].present?
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end

    @tags = Article.tag_counts.most_used.map(&:name)
  end

  def feed
    @articles = Article.includes(:user).where(user: current_user.followeds)

    @clips = current_user.clips
  end
end
