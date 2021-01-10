class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article!

  def create
    current_user.favorite(@article)
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Article was successfully upvoted.' }
      format.json { head :no_content }
    end
  end

  def destroy
    current_user.unfavorite(@article)
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Article was successfully downvoted.' }
      format.json { head :no_content }
    end   
  end

  private

  def set_article!
    @article = Article.find_by!(slug: params[:article_slug])
  end
end