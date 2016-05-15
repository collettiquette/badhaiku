require 'sinatra'
require 'sinatra/activerecord'
require_relative 'lib/word'
require_relative 'lib/stanza'
require_relative 'lib/haiku'

set :database, {adapter: 'sqlite3', database: 'words.sqlite3'}
Tilt.register Tilt::ERBTemplate, 'html.erb'

class PoemsApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    @haiku = Haiku.new
    erb :index
  end
end
