# INDEX
get '/albums' do
  @albums = Album.all
  erb :'albums/index'
end

# NEW
get '/albums/new' do
  @artists = Artist.all
  erb :'albums/new'
end

# CREATE
post '/albums' do
  album = Album.new( params )
  album.save
  redirect '/albums'  
end

# SHOW
get '/albums/:id' do
  id = params['id']
  @album = Album.find( id )
  erb :'albums/show'
end

# EDIT
get '/albums/:id/edit' do
  id = params['id']
  @artists = Artist.all
  @album = Album.find( id )
  erb :'albums/edit'
end

# UPDATE 
post '/albums/:id' do
  album = Album.new( params )
  album.update
  redirect '/albums'
end

# DESTROY
post '/albums/:id/delete' do
  id = params['id']
  Album.destroy( id )
  redirect '/albums'
end