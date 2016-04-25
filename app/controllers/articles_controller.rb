class ArticlesController < ApplicationController
  
  def new 
    # initialize@Article 
   @article = Article.new
  end
  
  def create
    # create article using article params
    @article = Article.new(article_params)
    
    # save article then redirect to article path, else render new
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
      
  end
  
  def show
    @article = Article.find(params[:id])
    
  end
  
  private
  
  def article_params
    # params for Article permit title, description
    params.require(:article).permit(:title, :description)
  end
  
  
end