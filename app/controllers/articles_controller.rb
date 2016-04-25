class ArticlesController < ApplicationController
  
  def new 
    # initialize@Article 
   @article = Article.new
  end
  
  def create
    # disply using Article params
    #render plain: params[:Article].inspect
   @article = Article.new(article_params)
   @article.save
   redirect_to articles_show(@article)
  end
  
  private
  
  def article_params
    # params for Article permit title, description
    params.require(:article).permit(:title, :description)
  end
  
  
end