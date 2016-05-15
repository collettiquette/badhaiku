# poems
A small sinatra app that generates shitty haiku

Instructions to run locally:

* Ensure you have RVM installed
* Install ruby-2.3.1 with RVM
* Pull down repo
* `cd poems`
* `gem install bundler`
* `bundle`
* `rake db:create && rake db:migrate && rake db:seed` Note it is importing 110k words, it will take a few minutes
* `rackup` Server will be running at localhost:9292

