class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def new 
    # initialize@Article 
    @article = Article.new
  end
  
  
  def edit
  end
  
  def create
    # create article using article params
    @article = Article.new(article_params)
    
    # save article then redirect to article path, else render new
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
        
  end
  
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def show
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
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