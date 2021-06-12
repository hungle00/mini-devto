class ClipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article!

  def create
    current_user.save(@article)
    redirect_to feed_path, notice: 'Article was successfully saved.'
  end

  def destroy
    current_user.unsave(@article)
    redirect_to feed_path, notice: 'Article was successfully unsaved.'  
  end

  private

  def set_article!
    @article = Article.find_by!(slug: params[:article_slug])
  end
end
