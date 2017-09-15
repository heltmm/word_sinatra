require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')


get('/') do
  @dictionary = Word.display
  erb(:word_input)
end

post('/') do
  @dictionary = Word.display
  name = params['name']
  hash = {'name' => name}
  word = Word.new(hash)
  word.save
  erb(:word_input)
end

get('/:name') do
  @word = Word.search(params[:name])
  erb(:word_display)
end

post('/:name') do
  @word = Word.search(params[:name])
  definition = params['definition']
  Word.add_definition(@word.name, definition)
  erb(:word_display)
end
