class ArticlesController < ApplicationController

  #callbacks
  before_action :set_article1, only: [:show, :edit, :update, :destroy]

  # Except the index and show def, all other defs need the http_basic_authenticate_with 
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
    @articles = Article.all
  end
  def show
  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      puts "#{@article}"
      # it will redirect to the :acticle of the web.
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
    
    if @article.update(article_params)
      puts "#{@article}"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  # define a strong parameters method
  # params.require(:article) => accesses the nested parameters for the comment object within the overall request parameters / enforces the presence of the :comment key, raising an error if it's missing.
  # .permit(:commenter, :body) => specifies which attributes are allowed to be passed through from the incoming parameters (in this case, only :commenter, :body are permitted.)
  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
  def set_article1
    @article = Article.find(params[:id])
  end
end
