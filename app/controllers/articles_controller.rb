class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new 
    # initialize@Article 
    @article = Article.new
  end
  
  
  def edit
    find_article
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
  
  
  def update
   find_article
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def show
    find_article
  end
  
  def destroy
    find_article
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
  
  def article_params
    # params for Article permit title, description
    params.require(:article).permit(:title, :description)
  end
  
  def find_article
   @article = Article.find(params[:id])
  end
  
end