class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.all.order("updated_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.save
        redirect_to @article
    else
      render action: 'new'
    end 
  end

  def edit
    @article = Article.find(params[:id])

    if current_user.id != @article.user_id
      @articles = Article.all.order("updated_at DESC")

      render action: 'index'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end 
  end

  def destroy
    @article = Article.find(params[:id])

    if current_user.id != @article.user_id
      @articles = Article.all.order("updated_at DESC")

      render action: 'index'
    else
      @article.destroy
      redirect_to articles_path
    end
  end  

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end    

end
