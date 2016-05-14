require 'sinatra'
require 'sinatra/activerecord'
require_relative 'lib/word'

set :database, {adapter: 'sqlite3', database: 'words.sqlite3'}
Tilt.register Tilt::ERBTemplate, 'html.erb'

class PoemsApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    p Word.count
    erb :index
  end
end
