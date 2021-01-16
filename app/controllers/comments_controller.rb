class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create(params.require(:comment).permit(:body, :article_id))
    @comment.article_id = @article.id
    @comment.save
    flash[:notice] = "Your comment is posted!"
    redirect_to article_path(@article)
  end
end
