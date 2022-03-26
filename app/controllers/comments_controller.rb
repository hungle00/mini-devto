class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article!, only: [:create, :edit, :update]
  before_action :authenticate_user!, except: [:index]

  # GET /comments
  # GET /comments.json
  #def index
  #  @comments = @article.comments.all
  #end

  def edit
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      render partial: 'comment', locals: { comment: @comment }, status: :ok
        #render partial: 'show', locals: { comment: comment }, status: :ok
    else
      render partial: 'form', locals: { comment: @comment }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.article, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_to @comment.article, notice: "Comment successfully deleted."
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
