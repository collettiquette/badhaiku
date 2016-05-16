require 'sinatra'
require 'sinatra/activerecord'
require_relative 'lib/word'
require_relative 'lib/stanza'
require_relative 'lib/haiku'

Tilt.register Tilt::ERBTemplate, 'html.erb'

class BadHaikuApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    @haiku = Haiku.new
    erb :index
  end
end
