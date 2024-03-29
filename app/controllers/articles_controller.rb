class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish, :relative]
  before_action :authenticate_user!, except: %i[index show]
  impressionist :actions => [:show]

  include ArticlesHelper

  # GET /articles
  # GET /articles.json
  def index
    @articles = current_user.articles.published
    @draft_articles = current_user.articles.draft
    #@articles = Article.all.includes(:user)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #@related_articles = @article.find_related_tags
    impressionist(@article)
    @author = @article.user.username
    @comment = Comment.new(article: @article)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article = assign_article_creator(@article, current_user)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.user_id == current_user.id
        @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def preview
    preview = "<i>#{request.raw_post}</i>"
    render plain: preview
  end

  def relative
    @articles = @article.find_related_tags

    render json: @articles
  end

  def publish
    @article.update(published: true)
    render partial: 'article', locals: { article: @article }, status: :ok
    #redirect_to articles_url
  end

  def unpublish
    @article.update(published: false)
    render partial: 'article', locals: { article: @article }, status: :ok
    #redirect_to articles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :tag_list)
    end
end
