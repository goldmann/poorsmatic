
require 'torquebox'
require 'sinatra'
require "sinatra/reloader"
require 'data_mapper'
require 'poorsmatic/model/url'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_migrate!

class Poorsmatic < Sinatra::Base
  use TorqueBox::Session::ServletStore

  configure :development do
    register Sinatra::Reloader
  end

  get '/urls' do
  end

end
