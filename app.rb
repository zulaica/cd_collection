require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cds')


get('/') do
  @collection = CD.all()
  erb(:index)
end

post('/') do
  @artist = params.fetch('add_artist')
  @album = params.fetch('add_album')
  @year = params.fetch('add_year')
  the_cd = CD.new({:artist => @artist, :album => @album, :year => @year})
  the_cd.store()
  redirect('/')
end

post('/results') do
  @search_by = params.fetch("search_by")
  @search_term = params.fetch("search_term")
  @search_results = CD.fetch(@search_by, @search_term)
  erb(:results)
end
