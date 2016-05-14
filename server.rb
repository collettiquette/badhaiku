require 'sinatra'
require_relative 'lib/word'
require_relative 'lib/word_list'
require_relative 'lib/poem_maker'

Tilt.register Tilt::ERBTemplate, 'html.erb'

class PoemsApp < Sinatra::Base
  get '/' do
    @lines = (0..2).map { PoemMaker.new.stanza }
    erb :index
  end
end
