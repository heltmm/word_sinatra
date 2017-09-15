require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('pry')


get('/') do
  @list = Word.all
  erb(:word_input)
end
