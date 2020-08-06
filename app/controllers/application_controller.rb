
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @new_article = Article.create(params[:article])
    redirect to("/articles/#{@new_article.id}")
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])
    @article.save
    redirect to("/articles/#{@article.id}")
  end

  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
  end
end
