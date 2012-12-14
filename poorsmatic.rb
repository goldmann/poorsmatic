
require 'torquebox'
require 'sinatra'
require "sinatra/reloader"
require 'data_mapper'
require 'haml'

require 'models/url'
require 'models/term'
require 'models/occurrence'

DataMapper::Model.raise_on_save_failure = true

class Poorsmatic < Sinatra::Base
  use TorqueBox::Session::ServletStore

  configure :development do
    register Sinatra::Reloader

    DataMapper::Logger.new(TorqueBox::Logger.new(DataMapper), :debug)
    DataMapper.setup(:default, 'sqlite:///tmp/poorsmatic.db')
    DataMapper.auto_migrate!
  end

  get '/' do
    haml :index
  end

  post '/term' do
    Term.create(:name => params[:name])
  end

  get '/terms' do
    Term.all
  end

  get '/urls' do
    Url.all
  end

end
