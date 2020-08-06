
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new
  get '/articles/new' do
    erb :new
  end

  #create
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #show
  get '/articles/:id' do
    if Article.all.find_by(id: params[:id]).nil?
      redirect to ('/articles')
    else
      @article = Article.all.find_by(id: params[:id])
      erb :show
    end  
  end

  #edit
  get '/articles/:id/edit' do
    if Article.all.find_by(id: params[:id]).nil?
      redirect to '/articles'
    else
      @article = Article.all.find_by(id: params[:id])
      erb :edit
    end
  end

  #update
  patch '/articles/:id' do
    @article = Article.all.find_by(id: params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #destroy

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end
  
end
