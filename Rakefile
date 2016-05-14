require 'sinatra/activerecord/rake'
require_relative 'lib/tasks/importer'

namespace :db do
  task :load_config do
    require './app'
  end

  task :seed do
    Importer.import!
  end
end
