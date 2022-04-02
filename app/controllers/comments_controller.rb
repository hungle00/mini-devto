class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article!, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, except: [:index]

  def new
    @comment = @article.comments.build
  end

  def edit
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment.user == current_user
      @comment.destroy
      redirect_to @comment.article, notice: "Comment successfully deleted."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article!
      @article = Article.friendly.find(params[:article_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
