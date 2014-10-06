class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    if @comment.save
      flash[:notice] = "comment submitted for review"
      redirect_to article_path(@article)
    else
      format.html { render :new }
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:author, :author_url, :content)
    end
end
