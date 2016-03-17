require 'sinatra'


# INDEX
get '/artists' do
  @artists = Artist.all
  erb :'artists/index'
end

# NEW
get '/artists/new' do
  erb :'artists/new'
end

# CREATE
post '/artists' do
  artist = Artist.new( params )
  artist.save( )
  redirect '/artists'
end

# EDIT
get '/artists/:id/edit' do
  id = params['id']
  @artist = Artist.find( id )
  erb :'artists/edit'
end

# UPDATE 
post '/artists/:id' do
  id = params['id']
  artist = Artist.new( params )
  artist.update()
  redirect '/artists'
end

# DESTROY
post '/artists/:id/delete' do
  Artist.destroy( params[:id] )
  redirect :'/artists'
end

# SHOW
get '/artists/:id' do
  id = params['id']
  @artist = Artist.find( id )
  @spotify = Spotify.find_artist(id)
  @image_array = Spotify.image( id )
  erb( :'artists/show' )
end
