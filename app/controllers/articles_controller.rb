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
  end

  #When a form is submitted, the fields of the form are sent to Rails as parameters
  def create
    #the params method is the object which represents the parameters (or fields) coming in from the form
    #render plain: params[:article].inspect (this will display the content in a simple hash form)

    #this creates a new DB entry
    @article = Article.new(article_params)
 
    #this saves the entry to the DB
    @article.save
    #this redirects the user to the show action
    redirect_to @article
  end

  #whitelists our controller parameters to prevent wrongful mass assignment
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
