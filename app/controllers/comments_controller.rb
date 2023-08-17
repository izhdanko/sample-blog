class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create]
  
  def create
     @article = Article.find(params[:article_id])
     @comment = @article.comments.create(author: current_user.username, user_id: current_user.id, body: comment_params[:body])

     redirect_to article_path(@article)

  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end   

end

