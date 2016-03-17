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

get '/stocks/search_artist' do 
  input = params['search']
  if input == ""
    redirect '/stocks'
  end
  @albums = Album.all
  @artists = Artist.all
  @stocks = Stock.search_artist( input )
  if @stocks == false
    redirect '/stocks/none_found'
  end
  erb :'stocks/index'
end

get '/stocks/search_album' do
  input = params['search']
  if input == ""
    redirect '/stocks'
  end
  @albums = Album.all
  @artists = Artist.all
  @stocks = Stock.search_album( input )
    if @stocks == false
      redirect '/stocks/none_found'
    end
  erb :'stocks/index'
end

get '/stocks/none_found' do
  erb :'stocks/none_found'
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