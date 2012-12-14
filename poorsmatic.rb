require 'torquebox'
require 'sinatra'
require "sinatra/reloader"
require 'data_mapper'
require 'haml'

require 'models/url'
require 'models/term'
require 'models/occurrence'

#DataMapper::Model.raise_on_save_failure = true

class Poorsmatic < Sinatra::Base
  include TorqueBox::Injectors

  use TorqueBox::Session::ServletStore
  use Rack::MethodOverride

  configure :development do
    register Sinatra::Reloader

    DataMapper::Logger.new(TorqueBox::Logger.new(DataMapper), :debug)
    DataMapper.setup(:default, 'sqlite:///tmp/poorsmatic.db')
    DataMapper.auto_migrate!
  end

  helpers do
    # This method is used to put the terms into the queue.
    # The method is executed every time a new term is added or deleted.
    def terms_changed
      terms = []

      Term.all.each {|t| terms << t.term}

      # Fetch the terms topic
      topic = fetch('/topics/terms')

      # Send the message (an array of terms) to the topic
      # even if this is an empty list
      topic.publish(terms)
    end
  end

  get '/' do
    haml :index
  end

  post '/terms' do
    term = Term.new(:term => params[:term])

    if term.save
      terms_changed
    else
      term.errors.each do |msg|
        puts msg
      end
    end

    redirect to('/terms')
  end

  delete '/term/:id' do
    Term.get(params[:id]).destroy
    terms_changed
    redirect to('/terms')
  end
 
  get '/terms' do
    @terms = Term.all
    haml :terms
  end

  get '/urls' do
    @urls = Url.all
    haml :urls
  end
end
