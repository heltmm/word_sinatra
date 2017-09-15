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

#only here incase someone manually types this adress in
get('/image/:name') do
  @word = Word.search(params[:name])
  redirect ("/#{params[:name]}")
  erb(:word_display)
end

post('/image/:name') do
  @word = Word.search(params[:name])
  link = params['link']
  Word.add_link(@word.name, link)
  redirect ("/#{params[:name]}")
  erb(:word_display)
end

get('/sort/') do
  Word.sort
  @dictionary = Word.display
  redirect ('/')
  erb(:word_input)
end

get('/all/') do
  @dictionary = Word.display
  if @dictionary.length == 0
    redirect ('/')
  end

  erb(:word_and_def)
end

get('/random/') do
  dictionary = Word.display
  if dictionary.length == 0
    redirect ('/')
  end
  @word = Word.random[0]
  erb(:word_display)
end

post('/delete/:name') do
  Word.remove(params[:name])
  redirect ('/')
end
