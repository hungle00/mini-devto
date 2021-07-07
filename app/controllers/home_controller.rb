class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @articles = pagy(Article.includes(:user, :impressions).order(created_at: :desc), items: 12)

    @articles = @articles.authored_by(params[:author]) if params[:author].present?
    @articles = @articles.favorited_by(params[:favorited]) if params[:favorited].present?

    @articles = @articles.search(params[:search])

    @tags = Article.tag_counts.most_used.map(&:name)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "articles", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end

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
