#articles controller
class ArticlesController < ApplicationController

  #shows all articles
  def index
    @articles = Article.all
  end

  #shows newly created article
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  #When a form is submitted, the fields of the form are sent to Rails as parameters
  def create
    #the params method = the content coming from the form

    #this creates a new DB entry
    @article = Article.new(article_params)
 
    #this saves the entry to the DB
    #the conditional is backup if the validation added in the model (app/models/article.rb) fails
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  #whitelists our controller parameters to prevent wrongful mass assignment
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
