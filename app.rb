ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/database_setup'

class BookMarkManager < Sinatra::Base
  get '/' do
    'Hello!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/add_link'
  end

  post '/links' do
    link = Link.create(url:params[:url],title:params[:title])
    tag = Tag.create(name:params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/news' do
    @links = Link.all
    erb :'/tags/news_tags'
  end

end
