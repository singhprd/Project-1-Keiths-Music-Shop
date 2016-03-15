# INDEX
get '/stocks' do
  @albums = Album.all
  @artists = Artist.all
  @stocks = Stock.all
  erb :'stocks/index'
end

# NEW
get '/stocks/new' do
  erb :'stocks/new'
end

# UPDATE ALL STOCKS
post '/stocks' do 
  Stock.update_all( params )
  redirect '/stocks'
end

get '/stocks/search' do 
  input = params['search']
  @albums = Album.all
  @artists = Artist.all
  @stocks = Stock.search( input )
  erb :'stocks/index'
end

# SHOW
get '/stocks/:id' do
  erb :'stocks/show'
end

# EDIT
get '/stocks/:id/edit' do
  erb :'stocks/edit'
end

# UPDATE 
put '/stocks/:id' do
  erb :'stocks/update'
end

# DESTROY
delete '/stocks/:id/delete' do
  erb :'stocks/index'
end